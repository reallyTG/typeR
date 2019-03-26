library(SEERaBomb)


### Name: fillPYM
### Title: Fills age-year person year (PY) matrix
### Aliases: fillPYM SEERaBomb_fillPYM
### Keywords: internal

### ** Examples

  yrs=1973:1990
  ages=0.5:70.5
  PYM=matrix(0,ncol=length(yrs),nrow=length(ages))
  colnames(PYM)=yrs
  rownames(PYM)=ages
(PYin=structure(c(3.5, 11.25,5.2, 51.5, 58.5,0.75, 1974, 1976,1978),.Dim = c(3L,3L), 
                  .Dimnames=list(c("1","2","3"),c("py", "ageL", "year"))))
fillPYM(PYin, PYM)



