context("modularity")

test_that("error checking",{
  expect_error(modularity("test",1:3),"Error in modularity: adj must be a numeric matrix")
  expect_error(modularity(1:3,1:3),"Error in modularity: adj must be a numeric matrix")
  expect_error(modularity(matrix(1:6,2,3),1:3),"Error in modularity: adj must be a square matrix")
  expect_error(modularity(matrix(1,1,1),1:3),"Error in modularity: adj must have dimensions at least 2")
  expect_error(modularity(matrix(c(0,1,2,0),2,2),1:3),"Error in modularity: adj must be symmetric")
  expect_error(modularity(matrix(c(1,1,1,0),2,2),1:3),"Error in modularity: diagonal of adj must contain only zeros")  
  expect_error(modularity(matrix(c(0,1,1,0),2,2),"test"),"Error in modularity: membership must be a numeric vector")    
  expect_error(modularity(matrix(c(0,1,1,0),2,2),1:3),"Error in modularity: membership must have length equal to the dimension of adj")
  expect_error(modularity(matrix(c(0,1,1,0),2,2),c(1,3)),"Error in modularity: entries of membership must be the first n whole numbers")  
})

test_that("test against the igraph function - only tests the main result, not the decomp",{
  #gr<-igraph::make_graph(edges="Bull")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,1,0,0,1,0,1,1,0,1,1,0,0,1,0,1,0,0,0,0,0,1,0,0),5,5)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res1<-modularity(ma,membership,decomp=FALSE)
  #resi<-igraph::modularity(gr,membership)
  resi<-(-0.1)
  expect_equal(res1,resi)
  expect_true(res1<=1 && res1>=-1) #Because Gomez et al says modularity is the difference of
                                   #two probabilities
  
  #gr<-igraph::make_graph(edges="Chvatal")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,0,0,0,0,0,1,0,0,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,1,0,0,1,0,1,1,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0),12,12)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res1<-modularity(ma,membership,decomp=FALSE)
  #resi<-igraph::modularity(gr,membership)
  resi<-(-0.25)
  expect_equal(res1,resi)
  expect_true(res1<=1 && res1>=-1)
  
  #gr<-igraph::make_graph(edges="Coxeter")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0),28,28)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res1<-modularity(ma,membership,decomp=FALSE)
  #resi<-igraph::modularity(gr,membership)
  resi<-1/6
  expect_equal(res1,resi)
  expect_true(res1<=1 && res1>=-1)
  
  #gr<-igraph::make_graph(edges="Cubical")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,0,1,1,0,0,0,1,0,1,0,0,1,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,0,0,1,1,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0,0,1,1,0,1,0),8,8)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res1<-modularity(ma,membership,decomp=FALSE)
  #resi<-igraph::modularity(gr,membership)
  resi<-1/6
  expect_equal(res1,resi)
  expect_true(res1<=1 && res1>=-1)
})

test_that("tests of the decomposition",{
  #test that the decomps add up to the total
  #gr<-igraph::make_graph(edges="Bull")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,1,0,0,1,0,1,1,0,1,1,0,0,1,0,1,0,0,0,0,0,1,0,0),5,5)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res<-modularity(ma,membership,decomp=TRUE)
  expect_equal(res$totQ,sum(res$modQ))
  expect_equal(res$totQ,sum(res$nodeQ))
    
  #gr<-igraph::make_graph(edges="Chvatal")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,0,0,0,0,0,1,0,0,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,1,0,0,1,0,1,1,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0),12,12)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res<-modularity(ma,membership,decomp=TRUE)
  expect_equal(res$totQ,sum(res$modQ))
  expect_equal(res$totQ,sum(res$nodeQ))

  #gr<-igraph::make_graph(edges="Coxeter")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0),28,28)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res<-modularity(ma,membership,decomp=TRUE)
  expect_equal(res$totQ,sum(res$modQ))
  expect_equal(res$totQ,sum(res$nodeQ))

  #gr<-igraph::make_graph(edges="Cubical")
  #ma<-igraph::as_adj(gr,sparse=FALSE)
  ma<-matrix(c(0,1,0,1,1,0,0,0,1,0,1,0,0,1,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,0,0,1,1,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0,0,1,1,0,1,0),8,8)
  n<-dim(ma)[1]
  membership<-c(rep(1,floor(n/2)),rep(2,ceiling(n/2)))
  res<-modularity(ma,membership,decomp=TRUE)
  expect_equal(res$totQ,sum(res$modQ))
  expect_equal(res$totQ,sum(res$nodeQ))
})

test_that("test against by-hand calculations for simple networks with positive weights",{
  #Function written by Lei, tests written by Dan
  
  #Adjacency matrix is ...
  A<-matrix(c(0,1,0,0,1,1,0,1,1,1,0,1,0,0,0,0,1,0,0,1,1,1,0,1,0),5,5)
  k<-apply(FUN=sum,MARGIN=2,X=A)
  m<-sum(A)/2
  P<-matrix(k,5,1) %*% matrix(k,1,5) /(2*m)
  #A particular partitioning is...
  delt<-matrix(c(1,0,1,0,1,
                 0,1,0,1,0,
                 1,0,1,0,1,
                 0,1,0,1,0,
                 1,0,1,0,1),5,5)
  res_hand<-sum((A-P)*delt)/(2*m)
  gps<-c(1,2,1,2,1)
  res_func<-modularity(A,gps,decomp=TRUE)
  expect_equal(res_hand,res_func$totQ)
  res_hand_decomp<-(A-P)*delt/(2*m)
  res_hand_node<-colSums(res_hand_decomp)
  expect_equal(res_hand_node,res_func$nodeQ)
  res_hand_mods<-c(sum(res_hand_node[gps==1]),sum(res_hand_node[gps==2]))
  expect_equal(res_hand_mods,res_func$modQ)
    
  #now do a weighted one with positive weights
  A<-matrix(c(0,.5,1,0,0,.5,0,0,0,3,1,0,0,.25,2,0,0,.25,0,1/3,0,3,2,1/3,0),5,5)
  m<-sum(A)/2
  k<-apply(FUN=sum,MARGIN=2,X=A)
  P<-matrix(k,5,1) %*% matrix(k,1,5) /(2*m)
  #A particular partitioning is...
  delt<-matrix(c(1,1,0,0,0,
                 1,1,0,0,0,
                 0,0,1,0,1,
                 0,0,0,1,0,
                 0,0,1,0,1),5,5)
  gps<-c(1,1,2,3,2)
  res_hand<-sum((A-P)*delt)/(2*m)
  res_func<-modularity(A,gps,decomp=TRUE)
  expect_equal(res_hand,res_func$totQ)
  res_hand_decomp<-(A-P)*delt/(2*m)
  res_hand_node<-colSums(res_hand_decomp)
  expect_equal(res_hand_node,res_func$nodeQ)
  res_hand_mods<-c(sum(res_hand_node[gps==1]),
                   sum(res_hand_node[gps==2]),
                   sum(res_hand_node[gps==3]))
  expect_equal(res_hand_mods,res_func$modQ)
})

test_that("test against a by-hand calculation for a simple network with some negative weights",{
  #Function written by Lei, tests written by Dan
  
  #try a very simple one with only 1s and -1s
  wij<-matrix(c(1,1,-1,-1,1,1,-1,-1,-1,-1,1,1,-1,-1,1,1),4,4)
  diag(wij)<-0
  wijplus<-pmax(wij,0)
  wijminus<-pmax(-wij,0)
  wiplus<-colSums(wijplus)
  wiminus<-colSums(wijminus)
  wplus<-sum(wijplus)/2
  wminus<-sum(wijminus)/2
  Pplus<-matrix(wiplus,4,1) %*% matrix(wiplus,1,4) /(2*wplus)
  Pminus<-matrix(wiminus,4,1) %*% matrix(wiminus,1,4) /(2*wminus)
  #a particular partitioning...
  delta<-matrix(c(1,1,0,0,1,1,0,0,0,0,1,1,0,0,1,1),4,4)
  Qplus<-sum((wijplus-Pplus)*delta)/(2*wplus)
  Qminus<-sum((wijminus-Pminus)*delta)/(2*wminus)
  res_hand<-(2*wplus/(2*wplus+2*wminus))*Qplus-(2*wminus/(2*wplus+2*wminus))*Qminus
  gps<-c(1,1,2,2)
  res_func<-modularity(wij,gps,decomp=TRUE)
  expect_equal(res_hand,res_func$totQ)
  Qplusdecomp<-(wijplus-Pplus)*delta/(2*wplus)
  Qminusdecomp<-(wijminus-Pminus)*delta/(2*wminus)
  Qdecomp<-(2*wplus/(2*wplus+2*wminus))*Qplusdecomp-
    (2*wminus/(2*wplus+2*wminus))*Qminusdecomp
  res_hand_node<-colSums(Qdecomp)
  expect_equal(res_hand_node,res_func$nodeQ)
  res_hand_mods<-c(sum(res_hand_node[gps==1]),sum(res_hand_node[gps==2]))
  expect_equal(res_hand_mods,res_func$modQ)
  
  #try another
  wij<-matrix(rnorm(25),5,5)
  diag(wij)<-0
  wij<-wij+t(wij)
  wijplus<-pmax(wij,0)
  wijminus<-pmax(-wij,0)
  wiplus<-colSums(wijplus)
  wiminus<-colSums(wijminus)
  wplus<-sum(wijplus)/2
  wminus<-sum(wijminus)/2
  Pplus<-matrix(wiplus,5,1) %*% matrix(wiplus,1,5) /(2*wplus)
  Pminus<-matrix(wiminus,5,1) %*% matrix(wiminus,1,5) /(2*wminus)
  #a particular partitioning...
  delta<-matrix(c(1,1,0,0,0,
                  1,1,0,0,0,
                  0,0,1,1,1,
                  0,0,1,1,1,
                  0,0,1,1,1),5,5)
  Qplus<-sum((wijplus-Pplus)*delta)/(2*wplus)
  Qminus<-sum((wijminus-Pminus)*delta)/(2*wminus)
  res_hand<-(wplus/(wplus+wminus))*Qplus-(wminus/(wplus+wminus))*Qminus
  gps<-c(1,1,2,2,2)
  res_func<-modularity(wij,gps,decomp=TRUE)
  expect_equal(res_hand,res_func$totQ)
  Qplusdecomp<-(wijplus-Pplus)*delta/(2*wplus)
  Qminusdecomp<-(wijminus-Pminus)*delta/(2*wminus)
  Qdecomp<-(2*wplus/(2*wplus+2*wminus))*Qplusdecomp-
    (2*wminus/(2*wplus+2*wminus))*Qminusdecomp
  res_hand_node<-colSums(Qdecomp)
  expect_equal(res_hand_node,res_func$nodeQ)
  res_hand_mods<-c(sum(res_hand_node[gps==1]),sum(res_hand_node[gps==2]))
  expect_equal(res_hand_mods,res_func$modQ)
})
