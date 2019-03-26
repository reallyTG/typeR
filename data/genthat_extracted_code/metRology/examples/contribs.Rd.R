library(metRology)


### Name: contribs
### Title: Extract contributions from an 'uncert' object.
### Aliases: contribs
### Keywords: univar

### ** Examples

  #Example with negative correlation
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.cor<-diag(1,4)
  u.cor[3,4]<-u.cor[4,3]<- -0.5
  u.form.c<-uncert(~a+b*2+c*3+d/2, x, u, method="NUM", cor=u.cor)

  contribs(u.form.c, simplify=FALSE)
  contribs(u.form.c)
  contribs(u.form.c, as.sd=TRUE)
  contribs(u.form.c, as.sd=TRUE, keep.sign=FALSE)

  contribs(u.form.c, scope=c("a", "c", "d") )

  #Effects of formula specification for scope:
  contribs(u.form.c, ~.)           #All contributions
  contribs(u.form.c, ~(a+b+c+d)^2) #same as ~.
  contribs(u.form.c, ~a+b+c+d )    #single-variable contributions only
  contribs(u.form.c, ~., expand.dot=FALSE )    # as ~a+b+c+d
  contribs(u.form.c, ~.-d)         #Drops d and c:d
  contribs(u.form.c, ~.-c:d)
  contribs(u.form.c, ~c+d)
  contribs(u.form.c, ~c*d)




