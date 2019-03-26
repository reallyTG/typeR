context("Graph modification parameter behaviour")

# set up test case
data(g_red)
data(pvals_red)
test.scores<-pvals_red
test.missing<-test.scores[sample(1:length(test.scores),1000,replace=F)]
test.added<-c(test.scores,seq(1e-8,1e-1,length.out=10))
names(test.added)<-c(names(test.scores),sapply(1:10,function(i)sprintf('Add.gene%i',i)))
test.both<-c(test.missing,seq(1e-8,1e-1,length.out=10))
names(test.both)<-c(names(test.missing),sapply(1:10,function(i)sprintf('Add.gene%i',i)))


res.miss1<-run.lean(network=g_red,ranking=test.missing,keep.nodes.without.scores=F,n_reps=2,ncores=2)
res.miss2<-run.lean(network=g_red,ranking=test.missing,keep.nodes.without.scores=T,n_reps=2,ncores=2)
test_that('Correct number of local subnetworks returned in missing case', {
      expect_equal( length(res.miss1$nhs), length(test.missing))
      expect_lte( length(res.miss2$nhs), length(V(g_red)))
      expect_gte( length(res.miss2$nhs), length(test.missing))
})

res.add1<-run.lean(network=g_red,ranking=test.added,add.scored.genes=F,n_reps=2,ncores=2)
res.add2<-run.lean(network=g_red,ranking=test.added,add.scored.genes=T,n_reps=2,ncores=2)
test_that('Correct number of local subnetworks returned in added case', {
  expect_equal( length(res.add1$nhs), length(V(g_red)))
  expect_equal( length(res.add2$nhs), length(test.added))
})


res.both1<-run.lean(network=g_red,ranking=test.both,keep.nodes.without.scores=F,add.scored.genes=F,n_reps=2,ncores=2)
res.both2<-run.lean(network=g_red,ranking=test.both,keep.nodes.without.scores=T,add.scored.genes=F,n_reps=2,ncores=2)
res.both3<-run.lean(network=g_red,ranking=test.both,keep.nodes.without.scores=F,add.scored.genes=T,n_reps=2,ncores=2)
res.both4<-run.lean(network=g_red,ranking=test.both,keep.nodes.without.scores=T,add.scored.genes=T,n_reps=2,ncores=2)
test_that('Correct number of local subnetworks returned in both case', {
  expect_lte( length(res.both1$nhs), length(V(g_red)))
  expect_lte( length(res.both1$nhs), length(test.both))
  expect_lte( length(res.both2$nhs), length(V(g_red)))
  expect_equal( length(res.both3$nhs), length(test.both))
  expect_gte( length(res.both4$nhs), length(test.both))
  expect_lte( length(res.both4$nhs), length(V(g_red))+10)
})