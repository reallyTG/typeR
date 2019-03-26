context("Transactions");

require(tools)

datadir<-sprintf("%s/rethinkdb-datadir",tempdir())
logfile<-sprintf("%s/rethinkdb-log",tempdir())
pidfile<-sprintf("%s/rethinkdb-pid",tempdir())
skipAll<-FALSE
port<-'37891'
portOff<-'9876'

tryKill<-function(){
 if(file.exists(pidfile)){
  try(scan(pidfile,what=numeric(),n=1,quiet=TRUE),silent=TRUE)->pid
  if(!inherits(pid,"try-error"))
   pskill(pid)
 }
}

## Set-up a throw-away rethinkdb server
#First, is rethink instlled?
try(system2('rethinkdb','-v',stderr=TRUE,stdout=TRUE),silent=TRUE)->ver
if(inherits(ver,"try-error")){
 message("No rethinkdb installed, skipping.")
 skipAll<-TRUE
}else{
 tryKill()

 #Invoke; this will do nothing when pidfile is ok
 system2('rethinkdb',c(
  '--no-update-check',
  '--no-http-admin',
  '--port-offset',portOff,
  '--directory',datadir,
  '--cores','1',
  '--io-threads','1',
  '--daemon',
  '--log-file',logfile,
  '--pid-file',pidfile
 ),stdout=FALSE,stderr=FALSE,wait=FALSE)
 Sys.sleep(5)
 try(openConnection(port=port),silent=TRUE)->J;
 if(!inherits(J,"try-error")){
  #Init DB for testing
  r()$db("test")$tableList()$run(J)->tables;
  if("rethinker_tests"%in%tables)
  r()$db("test")$tableDrop("rethinker_tests")$run(J);
  close(J);
 }else{
  message("Running throw-away RethinkDB server failed, skipping.")
  skipAll<-TRUE
 }
}

if(!skipAll){

test_that("Connection prints",{
 J<-openConnection(port=port);
 expect_output(print(J),"Opened");
 close(J);
});

test_that("Make table",{
 J<-openConnection(port=port);
 r()$db("test")$tableCreate("rethinker_tests")$run(J)->ans;
 expect_equal(ans$tables_created,1);
 close(J);
});

test_that("Insert, read and delete an object",{
 obj<-list(
  id=0,
  a=list(b=1,c=list(ca=LETTERS,cb=letters),d=3:5),
  d=6,e="siedem",
  f=8:10);
 J<-openConnection(port=port);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$insert(obj)$run(J)$inserted,
  1);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$get(0)$run(J)$a$c$ca,
  LETTERS);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$get(0)$delete()$run(J)$deleted,
  1);
 close(J);
});

test_that("Bulk insert, cursor",{
 lapply(1:1000,function(x) list(id=x,tester=77))->tins;
 J<-openConnection(port=port);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$insert(tins)$run(J)$inserted,
  1000);
 cur<-r()$db("test")$table("rethinker_tests")$run(J);

 expect_equal(
  cursorNext(cur)$tester,
  77);
 cursorNext(cur,inBatch=TRUE)->stuff;
 expect_gt(length(stuff),10);
 expect_equal(stuff[[6]]$tester,77);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$delete()$run(J)$deleted,
  1000);
 close(J);
});

test_that("Cursor emptying",{
 J<-openConnection(port=port);
 r()$db("test")$table("rethinker_tests")$changes()$run(J)->cur;
 expect_output(print(cur),"Active");
 close(cur); Sys.sleep(1);
 expect_output(print(cur),"Empty");
 expect_identical(cursorNext(cur),NULL);
 expect_identical(cursorNext(cur,inBatch=TRUE),list());

 r()$db("test")$table("rethinker_tests")$changes()$run(J)->cur;
 close(J); Sys.sleep(1);
 expect_output(print(cur),"Empty");
 expect_identical(cursorNext(cur),NULL);
 expect_identical(cursorNext(cur,inBatch=TRUE),list());
 close(cur);
});

test_that("Async queries",{
 J<-openConnection(port=port);
 had<-FALSE;
 r()$db("test")$table("rethinker_tests")$changes()$runAsync(J,function(r){
  had<<-TRUE;
  return(FALSE);
 });
 Sys.sleep(1); #Wait for changes observer to settle down
 r()$db("test")$table("rethinker_tests")$insert(list(id='zz',n=runif(10)),conflict="update")$run(J);
 drainConnection(J);
 expect_identical(had,TRUE);
 r()$db("test")$table("rethinker_tests")$delete()$run(J);
 close(J);
})

test_that("Sync-async mix",{
 J<-openConnection(port=port);
 r()$db("test")$table("rethinker_tests")$delete()$run(J);
 asyncCount<-0;
 r()$db("test")$table("rethinker_tests")$changes()$runAsync(J,function(r){
  asyncCount<<-asyncCount+1;
  return(asyncCount<5);
 });
 asyncCount2<-0;
 r()$db("test")$table("rethinker_tests")$changes()$runAsync(J,function(r){
  asyncCount2<<-asyncCount+1;
  return(asyncCount2<5);
 });
 r()$db("test")$table("rethinker_tests")$changes()$run(J)->cursor;
 Sys.sleep(1); #Wait for changes observer to settle down

 for(e in 1:5)
  r()$db("test")$table("rethinker_tests")$insert(list(id=220+e,n=runif(10)))$run(J);

 drainConnection(J);
 expect_equal(asyncCount,5);
 expect_equal(asyncCount2,5);
 cursorNext(cursor,inBatch=TRUE)->stuff;
 expect_equal(length(stuff),5);

 r()$db("test")$table("rethinker_tests")$delete()$run(J);
 close(J);
});

test_that("Profile",{
 J<-openConnection(port=port);
 expect_message(
  r()$db("test")$table("rethinker_tests")$count()$run(J,profile=TRUE),
  "Saved profile");
 expect_true(!is.null(J$lastProfile[[1]]$description));
 close(J);
});

test_that("Simple expression",{
 J<-openConnection(port=port);
 expect_equal(r()$add(r()$add(1,2),4)$run(J),7);
 close(J);
});

test_that("Map-reduce",{
 lapply(1:100,function(x) list(id=x,val=list(vall=x)))->tins;
 J<-openConnection(port=port);
 expect_equal(
  r()$db("test")$table("rethinker_tests")$insert(tins)$run(J)$inserted,
  100);

 r()$db("test")$table("rethinker_tests")$map(
  function(x) x$bracket("val")$bracket("vall")
 )$reduce(
  function(l,r) r()$add(l,r)
 )$run(J)->ans;

 expect_equal(
  r()$db("test")$table("rethinker_tests")$delete()$run(J)$deleted,
  100);
 close(J);
});

test_that("r() parameters",{
 J<-openConnection(port=port);
 expect_equal(
  r("test","rethinker_tests")$insert(list(id="xyz"))$run(J)$inserted,
  1);
 expect_equal(
  r("test","rethinker_tests")$delete()$run(J)$deleted,
  1);
 close(J);
});

test_that("complex filter with ",{
 J<-openConnection(port=port);
 lapply(1:10,function(x) list(id=letters[x],val=x))->stuff;
 expect_equal(
  r()$db("test")$
   table("rethinker_tests")$
   insert(stuff)$run(J)$inserted,
  10);
  expect_equal(
  r("test","rethinker_tests")$
   filter(
    function(x) r()$le(x$bracket("val"),5)
   )$count()$run(J)
  ,
  5
 );
 expect_equal(
 r("test","rethinker_tests")$
  filter(
   function(x) r()$and(
    r()$le(x$bracket("val"),5),
    r()$ge(x$bracket("val"),5),
    r()$ge(x$bracket("val"),2))
  )$count()$run(J)
  ,
  1
 );
 expect_equal(
  r("test","rethinker_tests")$delete()$run(J)$deleted,
  10);
 close(J);
});

test_that("Expr",{
 J<-openConnection(port=port);
 expect_equal(r()$expr(list(a=1,b=2,c=3))$keys()$run(J),c('a','b','c'));
 close(J);
});

} #Skip-all

tryKill()
