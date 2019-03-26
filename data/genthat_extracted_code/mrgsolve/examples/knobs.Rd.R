library(mrgsolve)


### Name: knobs
### Title: Run sensitivity analysis on model settings.
### Aliases: knobs knobs,mrgmod,missing-method
###   knobs,mrgmod,batch_mrgsims-method as.data.frame,batch_mrgsims-method
###   knobs,batch_mrgsims,ANY-method show,batch_mrgsims-method

### ** Examples

## example("knobs")

mod <- mrgsolve:::house(end=72)

events <- ev(amt=1000, cmt=1, addl=3, ii=12)

out <- mod %>% ev(events) %>% knobs(CL=c(1,2,3))
plot(out)

out

out <- mod %>% ev(events) %>% knobs(CL=c(1,2,3), VC=c(5,20,50))
plot(out)
plot(out,CP~.)
plot(out, CP~time|VC, groups=CL, lty=2)

out <- knobs(mod, amt=c(100,300,500), cmt=1)
plot(out)

out <- mod %>% knobs(amt=c(100,300), CL=c(1,3), VC=c(5,20), cmt=1)
plot(out)
plot(out, CP~.)

out <- knobs(mod, CL=c(1,2,3))
out

out <- knobs(mod, CL=c(1,2,3))
out



