library(nat)


### Name: xform
### Title: Transform the 3D location of objects such as neurons
### Aliases: xform xform.default xform.character xform.list xform.shape3d
###   xform.neuron xform.data.frame xform.dotprops xform.neuronlist

### ** Examples

## Not run: 
##D kc1=kcs20[[1]]
##D kc1.default=xform(kc1,function(x,...) x)
##D stopifnot(isTRUE(all.equal(kc1,kc1.default)))
##D kc1.5=xform(kc1,function(x,...) x, k=5)
##D stopifnot(isTRUE(all.equal(kc1.5,kc1.default)))
##D kc1.20=xform(kc1,function(x,...) x, k=20)
##D stopifnot(!isTRUE(all.equal(kc1,kc1.20)))
##D 
##D # apply two registrations converting sample->IS2->JFRC2
##D reg_seq=c("IS2_sample.list", "JFRC2_IS2.list")
##D xform(kc1, reg_seq)
##D # apply two registrations, swapping the direction of the second one
##D # i.e. sample -> IS2 -> FCWB
##D reg_seq=structure(c("IS2_sample.list", "IS2_FCWB.list"), swap=c(FALSE, TRUE))
##D xform(kc1, reg_seq)
## End(Not run)
## Not run: 
##D # apply reg1 to Cell07PNs[[1]], reg2 to Cell07PNs[[2]] etc
##D regs=c(reg1, reg2, reg3)
##D nx=xform(Cell07PNs[1:3], reg=regs, VectoriseRegistrations=TRUE)
## End(Not run)



