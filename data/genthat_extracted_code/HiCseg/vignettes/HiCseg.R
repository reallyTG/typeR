### R code from vignette source 'HiCseg.Rnw'

###################################################
### code chunk number 1: HiCseg.Rnw:40-41
###################################################
options(width=60)


###################################################
### code chunk number 2: loadparameters
###################################################
library(HiCseg)


###################################################
### code chunk number 3: loaddata
###################################################
data(matrix)
dim=dim(matrix)
n=dim[1]
image(1:n,1:n,matrix,xlab="",ylab="")


###################################################
### code chunk number 4: HiCseg_linkC_R
###################################################
result = HiCseg_linkC_R(200, 10, "G", matrix, "D")


###################################################
### code chunk number 5: resultHiCseg
###################################################
result$t_est_mat
result$J
result$t_hat
plot(result$J,type="o",xlab="K",ylab="Log-likelihood")


###################################################
### code chunk number 6: Plotblocks
###################################################
image(1:n,1:n,matrix,xlab="",ylab="")
t_hat=c(1,result$t_hat[result$t_hat!=0]+1)
for (i in 1:(length(t_hat)-1))
{
  lines(c(t_hat[i],t_hat[i]),c(t_hat[i],(t_hat[(i+1)]-1)))
  lines(c(t_hat[(i+1)]-1,t_hat[(i+1)]-1),c(t_hat[i],t_hat[(i+1)]-1))
  lines(c(t_hat[i],t_hat[(i+1)]-1),c(t_hat[i],t_hat[i]))
  lines(c(t_hat[i],t_hat[(i+1)]-1),c(t_hat[(i+1)]-1,t_hat[(i+1)]-1))
}


###################################################
### code chunk number 7: sessionInfo
###################################################
sessionInfo()


