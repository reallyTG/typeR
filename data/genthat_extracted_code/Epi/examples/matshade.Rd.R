library(Epi)


### Name: matshade
### Title: Plot confidence intervals as shaded areas around lines.
### Aliases: matshade
### Keywords: color

### ** Examples

# Follow-up data of Danish DM patients
data( DMlate )
mL <- Lexis( entry=list(age=dodm-dobth,per=dodm),
              exit=list(per=dox),
       exit.status=factor(!is.na(dodth),labels=c("Alive","Dead")),
              data=DMlate )
# Split follow-up and model by splines
sL <- splitLexis( mL, breaks=0:100, time.scale="age")
## Not run: 
##D # the same thing with popEpi
##D sL <- splitMulti( mL, age=0:100 )    
##D         
## End(Not run)
# Mortality rates separately for M and F:
mort <- glm( (lex.Xst=="Dead") ~ sex*Ns(age,knots=c(15,3:8*10)),
             offset = log(lex.dur),
             family = poisson,
               data = sL )
## Not run: 
##D # The counterpart with gam
##D library( mgcv )
##D mort <- gam( (lex.Xst=="Dead") ~ s(age,by=sex) + sex,
##D              offset = log(lex.dur),
##D              family = poisson,
##D                data = sL )
##D        
## End(Not run)
# predict rates (per 1000 PY) for men and women
ndM <- data.frame( age=10:90, sex="M", lex.dur=1 )
ndF <- data.frame( age=10:90, sex="F", lex.dur=1 )
# gam objects ignores the offset in prediction so
# lex.dur=1000 in prediction frame wll not work.
prM <- ci.pred( mort, ndM )*1000
prF <- ci.pred( mort, ndF )*1000
# predict rate-ratio
MFr <- ci.exp( mort, ctr.mat=list(ndM,ndF) )
# plot lines with shaded confidence limits
# for illustration we make a holes for the RRs:
MFr[40:45,2] <- NA
MFr[44:49,1] <- NA
matshade( ndM$age, cbind( MFr, prF, prM ), col=c(1,2,4), lwd=3,
          log="y", xlab="Age", ylab="Mortality per 1000 PY (and RR)" )
abline( h=1 )



