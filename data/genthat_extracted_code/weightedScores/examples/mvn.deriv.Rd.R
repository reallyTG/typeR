library(weightedScores)


### Name: mvn.deriv
### Title: Derivatives of Multivariate Normal Rectangle Probabilities
### Aliases: mvn.deriv mvn.deriv.margin mvn.deriv.rho
### Keywords: models

### ** Examples

# step size for numerical derivatives (accuracy of mvnapp etc may be about 1.e-4 to 1.e-5)
heps = 1.e-3

cat("compare numerical and analytical derivatives based on mvnapp\n")

cat("\ncase 1: dim=3\n");
m=3
mu=rep(0,m)
a=c(0,0,0)
b=c(1,1.5,2)
rr=matrix(c(1,.3,.3,.3,1,.4,.3,.4,1),m,m)
pr=mvnapp(a,b,mu,rr)$pr
# not checking ifail returned from mvnapp
cat("pr=mvnapp(avec,bvec,mu=0,sigma=corrmat)=",pr,"\n")

cat("derivative wrt a_k,b_k, k=1,...,",m,"\n")
for(k in 1:m)
{ cat("  k=", k, " lower\n")
  a2=a
  a2[k]=a[k]+heps
  pr2=mvnapp(a2,b,mu,rr)$pr
  da.numerical = (pr2-pr)/heps 
  da.analytic= mvn.deriv.margin(a,b,mu,rr,k,-1)$deriv
  cat("   numerical: ", da.numerical, ", analytic: ", da.analytic,"\n")
  cat("  k=", k, " upper\n")
  b2=b
  b2[k]=b[k]+heps
  pr2=mvnapp(a,b2,mu,rr)$pr
  db.numerical = (pr2-pr)/heps 
  db.analytic= mvn.deriv.margin(a,b,mu,rr,k,1)$deriv
  cat("   numerical: ", db.numerical, ", analytic: ", db.analytic,"\n")
}

cat("derivative wrt rho(j,k)\n")
for(j in 1:(m-1))
{ for(k in (j+1):m)
  { cat("  (j,k)=", j,k,"\n")
    rr2=rr
    rr2[j,k]=rr[j,k]+heps
    rr2[k,j]=rr[k,j]+heps
    pr2=mvnapp(a,b,mu,rr2)$pr
    drh.numerical = (pr2-pr)/heps 
    drh.analytic= mvn.deriv.rho(a,b,mu,rr2,j,k)$deriv
    cat("   numerical: ", drh.numerical, ", analytic: ", drh.analytic,"\n")
  }
}

#=============================================

cat("\ncase 2: dim=5\n");
m=5
mu=rep(0,m)
a=c(0,0,0,-1,-1)
b=c(1,1.5,2,2,2)
rr=matrix(c(1,.3,.3,.3,.4, .3,1,.4,.4,.4,  .3,.4,1,.4,.4,
  .3,.4,.4,1,.4, .4,.4,.4,.4,1),m,m)
pr=mvnapp(a,b,mu,rr)$pr
# not checking ifail returned from mvnapp
cat("pr=mvnapp(avec,bvec,mu=0,sigma=corrmat)=",pr,"\n")

cat("derivative wrt a_k,b_k, k=1,...,",m,"\n")
for(k in 1:m)
{ cat("  k=", k, " lower\n")
  a2=a
  a2[k]=a[k]+heps
  pr2=mvnapp(a2,b,mu,rr)$pr
  da.numerical = (pr2-pr)/heps 
  da.analytic= mvn.deriv.margin(a,b,mu,rr,k,-1)$deriv
  cat("   numerical: ", da.numerical, ", analytic: ", da.analytic,"\n")
  cat("  k=", k, " upper\n")
  b2=b
  b2[k]=b[k]+heps
  pr2=mvnapp(a,b2,mu,rr)$pr
  db.numerical = (pr2-pr)/heps 
  db.analytic= mvn.deriv.margin(a,b,mu,rr,k,1)$deriv
  cat("   numerical: ", db.numerical, ", analytic: ", db.analytic,"\n")
}


cat("derivative wrt rho(j,k): first order approx\n")
for(j in 1:(m-1))
{ for(k in (j+1):m)
  { cat("  (j,k)=", j,k,"\n")
    rr2=rr
    rr2[j,k]=rr[j,k]+heps
    rr2[k,j]=rr[k,j]+heps
    pr2=mvnapp(a,b,mu,rr2)$pr
    drh.numerical = (pr2-pr)/heps 
    drh.analytic= mvn.deriv.rho(a,b,mu,rr2,j,k)$deriv
    cat("   numerical: ", drh.numerical, ", analytic: ", drh.analytic,"\n")
  }
}

cat("\nsecond order approx\n")
pr=mvnapp(a,b,mu,rr,type=2)$pr
cat("pr=mvnapp(avec,bvec,mu=0,sigma=corrmat,type=2)=",pr,"\n")

cat("derivative wrt a_k,b_k, k=1,...,",m,"\n")
for(k in 1:m)
{ cat("  k=", k, " lower\n")
  a2=a
  a2[k]=a[k]+heps
  pr2=mvnapp(a2,b,mu,rr,type=2)$pr
  da.numerical = (pr2-pr)/heps 
  da.analytic= mvn.deriv.margin(a,b,mu,rr,k,-1,type=2)$deriv
  cat("   numerical: ", da.numerical, ", analytic: ", da.analytic,"\n")
  cat("  k=", k, " upper\n")
  b2=b
  b2[k]=b[k]+heps
  pr2=mvnapp(a,b2,mu,rr,type=2)$pr
  db.numerical = (pr2-pr)/heps 
  db.analytic= mvn.deriv.margin(a,b,mu,rr,k,1,type=2)$deriv
  cat("   numerical: ", db.numerical, ", analytic: ", db.analytic,"\n")
}

cat("derivative wrt rho(j,k): second order approx\n")
for(j in 1:(m-1))
{ for(k in (j+1):m)
  { cat("  (j,k)=", j,k,"\n")
    rr2=rr
    rr2[j,k]=rr[j,k]+heps
    rr2[k,j]=rr[k,j]+heps
    pr2=mvnapp(a,b,mu,rr2,type=2)$pr
    drh.numerical = (pr2-pr)/heps 
    drh.analytic= mvn.deriv.rho(a,b,mu,rr2,j,k,type=2)$deriv
    cat("   numerical: ", drh.numerical, ", analytic: ", drh.analytic,"\n")
  }
}



