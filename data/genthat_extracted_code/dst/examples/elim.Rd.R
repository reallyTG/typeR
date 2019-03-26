library(dst)


### Name: elim
### Title: Reduction of a relation
### Aliases: elim

### ** Examples

 
wr_tt <- matrix(c(0,1,rep(0,5),rep(c(1,0),2),1,1,0,1,0,
rep(1,3),0,1,0,rep(1,6)), ncol=4, byrow = TRUE)
colnames(wr_tt) <- c("rWdy Ry", "rWdy Rn", "rWdn Ry", "rWdn Rn")
 wr_spec = matrix(c(1:7, 0.0476, 0.7619, 0.1905, 0,0,0,0), 
 ncol = 2, dimnames = list(NULL, c("specnb", "mass"))) 
 wr_infovar = matrix(c(4,5,2,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size")) )
 wr_rel <- list(tt=wr_tt, con=0.16, spec=wr_spec,
  infovar=wr_infovar, 
  infovaluenames= list(Rain=c("Ry", "Rn"), RdWorks=c("rWdy", "rWdn") ))
 class(wr_rel)="bcaspec"
 elim(wr_rel, xnb = 5)
 elim(wr_rel, xnb = 4)
 
 mrt_tt <- matrix(c(1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1,rep(1,4)), 
 ncol=4, byrow = TRUE)
colnames(mrt_tt) <- c("t6", "f6", "t8", "f8")
 mrt_spec = matrix(c(1,1,1,2,2,2,3, 0.1, 0.1, 0.1, 0.7,0.7,0.7,0.2), 
 ncol = 2, dimnames = list(NULL, c("specnb", "mass"))) 
 mrt_infovar =matrix(c(6,8,2,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size")) )
 mrt_rel <- bcaRel(tt=mrt_tt, spec=mrt_spec, 
 infovar=mrt_infovar, 
 infovarnames= c("Maintenance", "Repair") )
 elim(mrt_rel, xnb = 6)
 elim(mrt_rel, xnb = 8)



