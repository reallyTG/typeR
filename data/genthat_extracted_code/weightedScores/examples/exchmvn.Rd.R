library(weightedScores)


### Name: exchmvn
### Title: Exchangeable (positive) multivariate normal
### Aliases: exchmvn exchmvn.deriv.margin exchmvn.deriv.rho
### Keywords: models

### ** Examples

# The tests here show clearly what the function parameters are.
# step size for numerical derivatives (accuracy of exchmvn etc about 1.e-6)
heps = 1.e-4

cat("case 1: m=3\n")
m=3
a=c(-1,-1,-1)
b=c(2,1.5,1)
rh=.6
pr=exchmvn(a,b,rh)
cat("pr=exchmvn(avec,bvec,rh)=",pr,"\n")
cat("derivative wrt rho\n")
rh2=rh+heps
pr2=exchmvn(a,b,rh2)
drh.numerical= (pr2-pr)/heps
drh.analytic= exchmvn.deriv.rho(a,b,rh)
cat("   numerical: ", drh.numerical, ", analytic: ", drh.analytic,"\n")

cat("derivative wrt a_k,b_k, k=1,...,",m,"\n")
for(k in 1:m)
{ cat("  k=", k, " lower\n")
  a2=a
  a2[k]=a[k]+heps
  pr2=exchmvn(a2,b,rh)
  da.numerical = (pr2-pr)/heps 
  da.analytic= exchmvn.deriv.margin(a,b,rh,k,-1)
  cat("   numerical: ", da.numerical, ", analytic: ", da.analytic,"\n")
  cat("  k=", k, " upper\n")
  b2=b
  b2[k]=b[k]+heps
  pr2=exchmvn(a,b2,rh)
  db.numerical = (pr2-pr)/heps 
  db.analytic= exchmvn.deriv.margin(a,b,rh,k,1)
  cat("   numerical: ", db.numerical, ", analytic: ", db.analytic,"\n")
}


cat("\ncase 2: m=5\n")
m=5
a=rep(-1,m)
b=c(2,1.5,1,1.5,2)
rh=.6
pr=exchmvn(a,b,rh)
cat("pr=exchmvn(avec,bvec,rh)=",pr,"\n")
cat("derivative wrt rho\n")
rh2=rh+heps
pr2=exchmvn(a,b,rh2)
drh.numerical= (pr2-pr)/heps
drh.analytic= exchmvn.deriv.rho(a,b,rh)
cat("   numerical: ", drh.numerical, ", analytic: ", drh.analytic,"\n")

cat("derivative wrt a_k,b_k, k=1,...,",m,"\n")
for(k in 1:m)
{ cat("  k=", k, " lower\n")
  a2=a
  a2[k]=a[k]+heps
  pr2=exchmvn(a2,b,rh)
  da.numerical = (pr2-pr)/heps 
  da.analytic= exchmvn.deriv.margin(a,b,rh,k,-1)
  cat("   numerical: ", da.numerical, ", analytic: ", da.analytic,"\n")
  cat("  k=", k, " upper\n")
  b2=b
  b2[k]=b[k]+heps
  pr2=exchmvn(a,b2,rh)
  db.numerical = (pr2-pr)/heps 
  db.analytic= exchmvn.deriv.margin(a,b,rh,k,1)
  cat("   numerical: ", db.numerical, ", analytic: ", db.analytic,"\n")
}




