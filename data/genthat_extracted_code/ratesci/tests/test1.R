library(ratesci)
context("Symmetry")

#n1 <- 150
#n2 <- 50
#n1 <- 80
#n2 <- 40
n1 <- 40
n2 <- 20
xs<-expand.grid(0:n1,0:n2)
x1 <- xs[,1]
x2 <- xs[,2]

#1865

#xs[2317,]
#scoreci(x1=x1,n1=n1,x2=x2,n2=n2,contrast="RD",distrib="poi",precis=10)$estimates
#scoreci(x1=x2,n1=n2,x2=x1,n2=n1,contrast="RD",distrib="poi",precis=10,plot=T)
#scoretheta(-1.000,x1=28,x2=48,n1=40,n2=80,contrast="RD",distrib="poi",skew=T)
#scoretheta(1.000,x1=48,x2=28,n1=80,n2=40,contrast="RD",distrib="poi",skew=T)

#mle <- scoreci(x1=x1,n1=n1,x2=x2,n2=n2,contrast="RD",distrib="poi,precis=10)$estimates[,2]
#sum(mle == 1)
#lcl <- scoreci(x1=x1,n1=n1,x2=x2,n2=n2,contrast="RD",distrib="poi",precis=10)$estimates[,1]
#sum(lcl == 1)
#matrix(lcl,nrow=51,byrow=T)[1:10,1:10]
#ucl <- scoreci(x1=x1,n1=n1,x2=x2,n2=n2,contrast="RD",distrib="poi",precis=10)$estimates[,3]
#sum(ucl == 1)
#1/matrix(ucl,nrow=51,byrow=T)[1:10,1:10]
  
#cc <- TRUE

for (cc in c(FALSE,TRUE)) {
  for (skew in c(TRUE, FALSE)) {
  
  test_that("Transposed inputs produce inverted intervals", {
    expect_equal(
      unname(scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,cc=cc,contrast="RD",precis=10)$estimates[, 1]),
      -unname(scoreci(x1=x2,n1=n2,x2=x1,n2=n1,skew=skew,cc=cc,contrast="RD",precis=10)$estimates[, 3])
    )
    expect_equal(
      unname(scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,cc=cc,contrast="RD",distrib="poi",precis=10)$estimates[, 1]),
      -unname(scoreci(x1=x2,n1=n2,x2=x1,n2=n1,skew=skew,cc=cc,contrast="RD",distrib="poi",precis=10)$estimates[, 3])
    )
    expect_equal(
      signif(unname(scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,cc=cc,contrast="RR",precis=100)$estimates)[, 1],digits=5),
      signif(1/unname(scoreci(x1=x2,n1=n2,x2=x1,n2=n1,skew=skew,cc=cc,contrast="RR",precis=100)$estimates)[, 3],digits=5)
    )
    expect_equal(
      signif(unname(scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,cc=cc,contrast="RR",distrib="poi",precis=10)$estimates)[, 1],digits=5),
      signif(1/unname(scoreci(x1=x2,n1=n2,x2=x1,n2=n1,skew=skew,cc=cc,contrast="RR",distrib="poi",precis=10)$estimates)[, 3],digits=5)
    )
    expect_equal(
      round(signif(unname(scoreci(x1=x1,n1=n1,x2=x2,n2=n2,skew=skew,cc=cc,contrast="OR",precis=10)$estimates)[, 1],digits=5),6), 
      round(signif(unname(1/scoreci(x1=x2,n1=n2,x2=x1,n2=n1,skew=skew,cc=cc,contrast="OR",precis=10)$estimates)[, 3],digits=5),6)
    )
  })
  
  }
}


n <- 10
combos <- NULL
for(a in 0:n) {
  for(b in 0:(n-a)) {
    for(c in 0:(n-a-b)) {
      for(d in 0:(n-a-b-c)) {
        combos <- rbind(combos,c(a=a,b=b,c=c,d=d))
      }
    }
  }
}	

test_that("Transposed inputs produce inverted paired intervals", {
  expect_equal(
    t(unname(round(sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast='RD')$estimates[,c(1,3)]),5))),
    t(unname(round(-sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,c(1,3,2,4)],contrast='RD')$estimates[,c(3,1)]),5)))
  )
  expect_equal(
    t(unname(round(1/round(1/sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,],contrast='RR')$estimates[,c(1,3)]),5),5))),
    t(unname(round(1/round(sapply(1:dim(combos)[1],function(i) pairbinci(x=combos[i,c(1,3,2,4)],contrast='RR')$estimates[,c(3,1)]),5),5)))
  )
})

if (FALSE) {
  
scoreci(x1=0,x2=0,n1=20,n2=10,contrast="RR",plot=T)
scoreci(x1=100,x2=0,n1=200,n2=5,plot=T)
scoreci(x1=0,x2=100,n1=5,n2=200,plot=T)


scoreci(x1=0,n1=80000,contrast="p",plot=T)

x1 <- 0
n1 <- 800
x2 <- NULL
n2 <- NULL
contrast="p"
distrib="bin"
bcf=TRUE
skew=TRUE
myfun <- function(theta, ...) {
  #  scoretheta(theta = theta, x1 = x1, x2 = x2, n1 = n1, n2 = n2, bcf = bcf,
  #             contrast = contrast, distrib = distrib, skew = skew)$score 
  scoretheta(theta = theta, x1 = x1, n1 = n1, contrast = "p", skew = T)$score 
}
myfun(theta=0.00064)
myfun(theta=0.00065)

myseq <- seq(0, 0.001, length.out = 400)
dim1 <- 1
sc <- array(sapply(myseq, function(x) myfun(x)), dim = c(dim1, length(myseq)))
myfun(theta=0.00064)
myfun(theta=0.00065)
scoretheta(theta=0.00064,x1=0,n1=800,distrib="bin",contrast="p",skew=T)$score
scoretheta(theta=0.00065,x1=0,n1=800,distrib="bin",contrast="p",skew=T)$score

}
