library(FSA)


### Name: capHistConvert
### Title: Convert between capture history data.frame formats.
### Aliases: capHistConvert
### Keywords: manip

### ** Examples

## A small example of 'event' format
( ex1 <- data.frame(fish=c(17,18,21,17,21,18,19,20),yr=c(1987,1987,1987,1988,1988,1989,1989,1990)) )
# convert to 'individual' format
( ex1.E2I <- capHistConvert(ex1,id="fish",in.type="event") )
# convert to 'frequency' format
( ex1.E2F <- capHistConvert(ex1,id="fish",in.type="event",out.type="frequency") )
# convert to 'MARK' format
( ex1.E2M <- capHistConvert(ex1,id="fish",in.type="event",out.type="MARK") )
# convert to 'RMark' format
( ex1.E2R <- capHistConvert(ex1,id="fish",in.type="event",out.type="RMark") )

## convert converted 'individual' format ...
# to 'frequency' format (must ignore "id")
( ex1.I2F <- capHistConvert(ex1.E2I,id="fish",in.type="individual",out.type="frequency") )
# to 'MARK' format
( ex1.I2M <- capHistConvert(ex1.E2I,id="fish",in.type="individual",out.type="MARK") )
# to 'RMark' format
( ex1.I2R <- capHistConvert(ex1.E2I,id="fish",in.type="individual",out.type="RMark") )
# to 'event' format
( ex1.I2E <- capHistConvert(ex1.E2I,id="fish",in.type="individual",out.type="event") )

#' ## convert converted 'frequency' format ...
# to 'individual' format
( ex1.F2I <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency") )
( ex1.F2Ia <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency",include.id=TRUE) )
# to 'Mark' format
( ex1.F2M <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency",
                            out.type="MARK") )
# to 'RMark' format
( ex1.F2R <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency",
                            out.type="RMark") )
( ex1.F2Ra <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency",
                             out.type="RMark",include.id=TRUE) )
# to 'event' format
( ex1.F2E <- capHistConvert(ex1.E2F,freq="freq",in.type="frequency",
                            out.type="event") )

## convert converted 'MARK' format ...
# to 'individual' format
( ex1.M2I <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK") )
( ex1.M2Ia <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK",include.id=TRUE) )
# to 'frequency' format
( ex1.M2F <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK",out.type="frequency") )
# to 'RMark' format
( ex1.M2R <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK",out.type="RMark") )
( ex1.M2Ra <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK",out.type="RMark",include.id=TRUE) )
# to 'event' format
( ex1.M2E <- capHistConvert(ex1.E2M,freq="freq",in.type="MARK",out.type="event") )
 
## convert converted 'RMark' format ...
# to 'individual' format
( ex1.R2I <- capHistConvert(ex1.E2R,id="fish",in.type="RMark") )
# to 'frequency' format
( ex1.R2F <- capHistConvert(ex1.E2R,id="fish",in.type="RMark",out.type="frequency") )
# to 'MARK' format
( ex1.R2M <- capHistConvert(ex1.E2R,id="fish",in.type="RMark",out.type="MARK") )
# to 'event' format
( ex1.R2E <- capHistConvert(ex1.E2R,id="fish",in.type="RMark",out.type="event") )

## Remove semi-colon from MARK format to make a RMark 'frequency' format
ex1.E2R1 <- ex1.E2M
ex1.E2R1$freq <- as.numeric(sub(";","",ex1.E2R1$freq))
ex1.E2R1
# convert this to 'individual' format
( ex1.R2I1 <- capHistConvert(ex1.E2R1,freq="freq",in.type="RMark") )
( ex1.R2I1a <- capHistConvert(ex1.E2R1,freq="freq",in.type="RMark",include.id=TRUE) )
# convert this to 'frequency' format
( ex1.R2F1 <- capHistConvert(ex1.E2R1,freq="freq",in.type="RMark",out.type="frequency") )
# convert this to 'MARK' format
( ex1.R2M1 <- capHistConvert(ex1.E2R1,freq="freq",in.type="RMark",out.type="MARK") )
# convert this to 'event' format
( ex1.R2E1 <- capHistConvert(ex1.E2R1,freq="freq",in.type="RMark",out.type="event") )


########################################################################
## A small example using character ids
( ex2 <- data.frame(fish=c("id17","id18","id21","id17","id21","id18","id19","id20"),
                    yr=c(1987,1987,1987,1988,1988,1989,1989,1990)) )
# convert to 'individual' format
( ex2.E2I <- capHistConvert(ex2,id="fish",in.type="event") )
# convert to 'frequency' format
( ex2.E2F <- capHistConvert(ex2,id="fish",in.type="event",out.type="frequency") )
# convert to 'MARK' format
( ex2.E2M <- capHistConvert(ex2,id="fish",in.type="event",out.type="MARK") )
# convert to 'RMark' format
( ex2.E2R <- capHistConvert(ex2,id="fish",in.type="event",out.type="RMark") )

## convert converted 'individual' format ...
# to 'frequency' format
( ex2.I2F <- capHistConvert(ex2.E2I,id="fish",in.type="individual",out.type="frequency") )
# to 'MARK' format
( ex2.I2M <- capHistConvert(ex2.E2I,id="fish",in.type="individual",out.type="MARK") )
# to 'RMark' format
( ex2.I2R <- capHistConvert(ex2.E2I,id="fish",in.type="individual",out.type="RMark") )
# to 'event' format
( ex2.I2E <- capHistConvert(ex2.E2I,id="fish",in.type="individual",out.type="event") )

## demo use of var.lbls
( ex2.E2Ia <- capHistConvert(ex2,id="fish",in.type="event",var.lbls.pre="Sample") )
( ex2.E2Ib <- capHistConvert(ex2,id="fish",in.type="event",
              var.lbls=c("first","second","third","fourth")) )

## demo use of event.ord
( ex2.I2Ea <- capHistConvert(ex2.E2Ib,id="fish",in.type="individual",out.type="event") )
( ex2.E2Ibad <- capHistConvert(ex2.I2Ea,id="fish",in.type="event") )
( ex2.E2Igood <- capHistConvert(ex2.I2Ea,id="fish",in.type="event",
                 event.ord=c("first","second","third","fourth")) )

## ONLY RUN IN INTERACTIVE MODE
if (interactive()) {

########################################################################
## A larger example of 'frequency' format (data from Rcapture package)
data(bunting,package="Rcapture")
head(bunting)
# convert to 'individual' format
bun.F2I <- capHistConvert(bunting,in.type="frequency",freq="freq")
head(bun.F2I)
# convert to 'MARK' format
bun.F2M <- capHistConvert(bunting,id="id",in.type="frequency",freq="freq",out.type="MARK")
head(bun.F2M)
# convert converted 'individual' back to 'MARK' format
bun.I2M <- capHistConvert(bun.F2I,id="id",in.type="individual",out.type="MARK")
head(bun.I2M)
# convert converted 'individual' back to 'frequency' format
bun.I2F <- capHistConvert(bun.F2I,id="id",in.type="individual",
           out.type="frequency",var.lbls.pre="Sample")
head(bun.I2F)


########################################################################
## A larger example of 'marked' or 'RMark' format, but with a covariate
##   and when the covariate is removed there is no frequency or individual
##   fish identifier.
data(dipper,package="marked")
head(dipper)
# isolate males and females
dipperF <- subset(dipper,sex=="Female")
dipperM <- subset(dipper,sex=="Male")
# convert females to 'individual' format
dipF.R2I <- capHistConvert(dipperF,cols2ignore="sex",in.type="RMark")
head(dipF.R2I)
# convert males to 'individual' format
dipM.R2I <- capHistConvert(dipperM,cols2ignore="sex",in.type="RMark")
head(dipM.R2I)
# add sex variable to each data.frame and then combine
dipF.R2I$sex <- "Female"
dipM.R2I$sex <- "Male"
dip.R2I <- rbind(dipF.R2I,dipM.R2I)
head(dip.R2I)
tail(dip.R2I)

} # end interactive


## An example of problem with unused levels
## Create a set of test data with several groups
( df <- data.frame(fish=c("id17","id18","id21","id17","id21","id18","id19","id20","id17"),
                   group=c("B1","B1","B1","B2","B2","B3","B4","C1","C1")) )
#  Let's assume the user wants to subset the data from the "B" group
( df1 <- subset(df,group %in% c("B1","B2","B3","B4")) )
#  Looks like capHistConvert() is still using the unused factor
#  level from group C
capHistConvert(df1,id="fish",in.type="event")
# use droplevels() to remove the unused groups and no problem
df1 <- droplevels(df1)
capHistConvert(df1,id="fish",in.type="event")




