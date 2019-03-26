context("cluseigen")

test_that("error checking",{
  expect_error(cluseigen("test"),"Error in cluseigen: input must be a numeric matrix")
  expect_error(cluseigen(c(1,2,3)),"Error in cluseigen: input must be a numeric matrix")
  expect_error(cluseigen(matrix(1:6,2,3)),"Error in cluseigen: input must be a square matrix")
  expect_error(cluseigen(matrix(1,1,1)),"Error in cluseigen: input matrix must have dimensions at least 2")  
  expect_error(cluseigen(matrix(c(0,1,2,0),2,2)),"Error in cluseigen: input matrix must be symmetric")
  expect_error(cluseigen(matrix(c(1,1,1,0),2,2)),"Error in cluseigen: diagonal of input matrix must contain only zeros")
})

test_that("test on a completely connected graph",{
  adj<-matrix(1,5,5)
  diag(adj)<-0
  res<-cluseigen(adj)
  expect_equal(class(res),"list")
  expect_equal(length(res),1)
  expect_equal(res[[1]],rep(1,5))
})

test_that("test on a simple disconnected example",{
  adj<-matrix(c(0,1,0,0,1,0,0,0,0,0,0,1,0,0,1,0),4,4)
  res<-cluseigen(adj)
  expect_equal(class(res),"list")
  expect_equal(length(res),2)
  expect_equal(res[[1]],rep(1,4))
  
  #check the clustering is the same except for possible cluster relabeling,
  #i.e., check that d defines a bijective map from the cluster labels
  #d$x to the cluster labels d$y
  d<-data.frame(x=c(1,1,2,2),y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
})

test_that("test on a simple example where there should be two splits",{
  adj<-matrix(c(0,1,0,0,0,0,0,0,
                1,0,.5,0,0,0,0,0,
                0,.5,0,1,0,0,0,0,
                0,0,1,0,0,0,0,0,
                0,0,0,0,0,1,0,0,
                0,0,0,0,1,0,.5,0,
                0,0,0,0,0,.5,0,1,
                0,0,0,0,0,0,1,0),8,8,byrow=TRUE)
  res<-cluseigen(adj)
  expect_equal(length(res),4)
  expect_equal(res[[1]],rep(1,8))
  
  #expect_equal(res[[2]],c(rep(2,4),rep(1,4)))
  #check the clustering is the same except for possible cluster relabeling,
  #i.e., check that d defines a bijective map from the cluster labels
  #d$x to the cluster labels d$y
  d<-data.frame(x=c(rep(2,4),rep(1,4)),y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  
  #expect_equal(res[[4]],c(4,4,3,3,2,2,1,1))
  #check the clustering is the same except for possible cluster relabeling,
  #i.e., check that d defines a bijective map from the cluster labels
  #d$x to the cluster labels d$y
  d<-data.frame(x=c(4,4,3,3,2,2,1,1),y=res[[4]]) 
  expect_equal(length(unique(d$y)),4) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],4) #check it's a well-defined map
})

test_that("unweighted, by-hand checks",{
  #code written by Lei, tests by Dan

  #simple one
  A<-matrix(c(1,1,1,0,0,
              1,1,1,0,0,
              1,1,1,0,0,
              0,0,0,1,1,
              0,0,0,1,1),5,5)
  diag(A)<-0
  k<-colSums(A)
  m<-sum(A)
  P<-matrix(k,length(k),1) %*% matrix(k,1,length(k))/(2*m)
  B<-A-P
  es<-eigen(B,symmetric=TRUE)
  h<-sign(es$vectors[,1])
  res<-cluseigen(A)
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  expect_gt(matrix(h,1,length(h)) %*% B %*% matrix(h,length(h),1),0)

  #more complex one
  set.seed(302)
  A<-matrix(runif(100),10,10)/2
  A<-A+t(A)
  diag(A)<-0
  A<-round(A)
  k<-colSums(A)
  m<-sum(A)/2
  P<-matrix(k,length(k),1) %*% matrix(k,1,length(k))/(2*m)
  B<-A-P
  es<-eigen(B,symmetric=TRUE)
  h<-sign(es$vectors[,1])
  res<-cluseigen(A)
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  expect_gt(matrix(h,1,length(h)) %*% B %*% matrix(h,length(h),1),0)

  #possible relabeling - for platform independence, since it seems
  #to depend on platform the labelling that was used, 1 and 2 
  #versus 2 and 1 for the two groups after the first split
  num1<-sum(res[[2]]==1)
  gp<-res[[2]]
  if (num1==6)
  {
    gp[gp==1]<-3
    gp[gp==2]<-1
    gp[gp==3]<-2
  }
    
  #check the subsequent splitting
  gp1inds<-which(gp==1)
  Bg1<-B[gp1inds,gp1inds]
  diag(Bg1)<-diag(Bg1)-rowSums(Bg1)
  es1<-eigen(Bg1,symmetric=TRUE)
  expect_equal(es1$values[1],0) #no further split to this group

  gp2inds<-which(gp==2)
  Bg2<-B[gp2inds,gp2inds]
  diag(Bg2)<-diag(Bg2)-rowSums(Bg2)
  es2<-eigen(Bg2,symmetric=TRUE)
  h<-sign(es2$vectors[,1])
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[3]][gp2inds]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  expect_gt(matrix(h,1,length(h)) %*% Bg2 %*% matrix(h,length(h),1),0)

  #another
  set.seed(202)
  A<-matrix(runif(100),10,10)/2
  A<-A+t(A)
  diag(A)<-0
  A<-round(A)
  k<-colSums(A)
  m<-sum(A)/2
  P<-matrix(k,length(k),1) %*% matrix(k,1,length(k))/(2*m)
  B<-A-P
  es<-eigen(B,symmetric=TRUE)
  res<-cluseigen(A)
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=sign(es$vectors[,1]),y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  h<-sign(es$vectors[,1])
  expect_gt(matrix(h,1,length(h)) %*% B %*% matrix(h,length(h),1),0)

  #do a bigger one
  set.seed(101)
  A<-matrix(runif(2500),50,50)/2
  A<-A+t(A)
  diag(A)<-0
  A<-round(A)
  k<-colSums(A)
  m<-sum(A)/2
  P<-matrix(k,length(k),1) %*% matrix(k,1,length(k))/(2*m)
  B<-A-P
  es<-eigen(B,symmetric=TRUE)
  res<-cluseigen(A)
  h<-sign(es$vectors[,1])
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[2]]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  expect_gt(matrix(h,1,length(h)) %*% B %*% matrix(h,length(h),1),0)

  #possible relabeling - for platform independence, since it seems
  #to depend on platform the labelling that was used, 1 and 2 
  #versus 2 and 1 for the two groups
  num1<-sum(res[[2]]==1)
  gp<-res[[2]]
  if (num1==23)
  {
    gp[gp==1]<-3
    gp[gp==2]<-1
    gp[gp==3]<-2
  }
  
  #check the subsequent splitting
  gp1inds<-which(gp==1)
  Bg1<-B[gp1inds,gp1inds]
  diag(Bg1)<-diag(Bg1)-rowSums(Bg1)
  es1<-eigen(Bg1,symmetric=TRUE)
  h<-sign(es1$vectors[,1])
  #rbind(res[[3]][gp1inds],h) #looks like it should have been split but wasnt so check whether the 
  #proposed split actually makes the modularity go down, in which case it would not have been done
  expect_lt(matrix(h,1,length(h)) %*% Bg1 %*% matrix(h,length(h),1),0)
  
  gp2inds<-which(gp==2)
  Bg2<-B[gp2inds,gp2inds]
  diag(Bg2)<-diag(Bg2)-rowSums(Bg2)
  es2<-eigen(Bg2,symmetric=TRUE)
  h<-sign(es2$vectors[,1])
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[3]][gp2inds]) 
  expect_equal(length(unique(d$y)),2) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],2) #check it's a well-defined map
  #make sure the modularity went up, or the split should not have been adopted
  expect_gt(matrix(h,1,length(h)) %*% Bg2 %*% matrix(h,length(h),1),0)
})

test_that("positive weights, by-hand checks",{
  set.seed(302)
  A<-matrix(runif(100),10,10)
  A<-A+t(A)
  diag(A)<-0
  k<-colSums(A)
  m<-sum(A)/2
  P<-matrix(k,length(k),1) %*% matrix(k,1,length(k))/(2*m)
  B<-A-P
  es<-eigen(B,symmetric=TRUE)
  res<-cluseigen(A)
  #res[[2]]
  #sign(es$vectors[,1])
  h<-sign(es$vectors[,1])
  #expect_equal(res[[2]],h)  
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[2]]) 
  expect_equal(length(unique(d$y)),length(unique(d$x))) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],length(unique(d$x))) #check it's a well-defined map
  
  #possible relabeling - for platform independence, since it seems
  #to depend on platform the labelling that was used, 1 and 2 
  #versus 2 and 1 for the two groups
  num1<-sum(res[[2]]==1)
  gp<-res[[2]]
  if (num1==7)
  {
    gp[gp==1]<-3
    gp[gp==2]<-1
    gp[gp==3]<-2
  }
  
  #check subsequent splits
  gp1inds<-which(gp==1)
  Bg1<-B[gp1inds,gp1inds]
  diag(Bg1)<-diag(Bg1)-rowSums(Bg1)
  es1<-eigen(Bg1,symmetric=TRUE)
  expect_equal(es1$values[1],0) #because gp 1 was not further split
  
  gp2inds<-which(gp==2)
  Bg2<-B[gp2inds,gp2inds]
  diag(Bg2)<-diag(Bg2)-rowSums(Bg2)
  es2<-eigen(Bg2,symmetric=TRUE)$vectors[,1]
  h<-sign(es2)
  #res[[3]][gp2inds]
  #h
  d<-data.frame(x=h,y=res[[3]][gp2inds]) 
  expect_equal(length(unique(d$y)),length(unique(d$x))) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],length(unique(d$x))) #check it's a well-defined map
})

test_that("positive and negative weights, by-hand checks",{
  set.seed(101)
  wij<-matrix(rnorm(100),10,10)
  wij<-wij+t(wij)
  diag(wij)<-0
  wijplus<-matrix(pmax(0,wij),10,10)
  wijminus<-matrix((-1)*pmin(0,wij),10,10)
  wiplus<-colSums(wijplus)
  wiminus<-colSums(wijminus)
  wplus<-sum(wijplus)/2
  wminus<-sum(wijminus)/2
  B<-wij-(matrix(wiplus,length(wiplus),1) %*% matrix(wiplus,1,length(wiplus)))/(2*wplus)+
    (matrix(wiminus,length(wiminus),1) %*% matrix(wiminus,1,length(wiminus)))/(2*wminus)
  es<-eigen(B,symmetric=TRUE)
  res<-cluseigen(wij)
  #res[[2]]
  #sign(es$vectors[,1])
  h<-sign(es$vectors[,1])
  #check the clustering is the same except for possible cluster relabeling
  d<-data.frame(x=h,y=res[[2]]) 
  expect_equal(length(unique(d$y)),length(unique(d$x))) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],length(unique(d$x))) #check it's a well-defined map
  
  #possible relabeling - for platform independence, since it seems
  #to depend on platform the labelling that was used, 1 and 2 
  #versus 2 and 1 for the two groups
  num1<-sum(res[[2]]==1)
  gp<-res[[2]]
  if (num1==4)
  {
    gp[gp==1]<-3
    gp[gp==2]<-1
    gp[gp==3]<-2
  }
  
  #do the next split
  gp1inds<-which(gp==1)
  Bg1<-B[gp1inds,gp1inds]
  diag(Bg1)<-diag(Bg1)-rowSums(Bg1)
  es1<-eigen(Bg1,symmetric=TRUE)
  h<-sign(es1$vectors[,1])
  d<-data.frame(x=h,y=res[[3]][gp1inds]) 
  expect_equal(length(unique(d$y)),length(unique(d$x))) #so check it's the same number of clusters 
  expect_equal(dim(unique(d))[1],length(unique(d$x))) #check it's a well-defined map
  
  gp2inds<-which(gp==2)
  Bg2<-B[gp2inds,gp2inds]
  diag(Bg2)<-diag(Bg2)-rowSums(Bg2)
  es2<-eigen(Bg2,symmetric=TRUE)$vectors[,1]
  h<-sign(es2)
  #res[[3]][gp2inds]
  #h #these disagreed so check that the proposed split was going to make the modularity go down
  #and so that was why it was not adopted
  expect_lt(matrix(h,1,length(h)) %*% Bg2 %*% matrix(h,length(h),1),0)
})

