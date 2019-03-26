library(stpm)


### Name: spm_con_1d
### Title: Fitting a 1-D SPM model with constant parameters
### Aliases: spm_con_1d

### ** Examples

{ 
library(stpm) 
dat <- simdata_cont(N=500)
colnames(dat) <- c("id", "xi", "t1", "t2", "y", "y.next")
res <- spm_con_1d(as.data.frame(dat), a=-0.05, b=2, q=1e-8, f=80, f1=90, mu0=1e-3, theta=0.08)
}



