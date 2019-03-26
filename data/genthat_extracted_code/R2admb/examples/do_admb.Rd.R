library(R2admb)


### Name: do_admb
### Title: Compile and/or run an ADMB model, collect output
### Aliases: do_admb
### Keywords: misc

### ** Examples


## Not run: 
##D setup_admb()
##D file.copy(system.file("tplfiles","ReedfrogSizepred0.tpl",package="R2admb"),"tadpole.tpl")
##D tadpoledat <-
##D  data.frame(TBL = rep(c(9,12,21,25,37),each=3),
##D             Kill = c(0,2,1,3,4,5,0,0,0,0,1,0,0,0,0L),
##D             nexposed=rep(10,15))
##D m1 <- do_admb("tadpole",
##D              data=c(list(nobs=15),tadpoledat),
##D              params=list(c=0.45,d=13,g=1),
##D              bounds=list(c=c(0,1),d=c(0,50),g=c(-1,25)),
##D              run.opts=run.control(checkparam="write",
##D                checkdata="write",clean="all"))
##D m2 <- do_admb("tadpole",
##D              data=c(list(nobs=15),tadpoledat),
##D              params=list(c=list(0.45,bounds=c(0,1)),
##D                          d=list(13,bounds=c(0,50)),
##D                          g=list(1,bounds=c(-1,25))),
##D              run.opts=run.control(checkparam="write",
##D                checkdata="write",clean="all"))
##D unlink("tadpole.tpl")
## End(Not run)




