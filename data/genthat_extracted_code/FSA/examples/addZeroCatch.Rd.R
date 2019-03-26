library(FSA)


### Name: addZeroCatch
### Title: Adds zeros for catches of species not collected in some sampling
###   events.
### Aliases: addZeroCatch
### Keywords: manip

### ** Examples

## Example Data #1 (some nets missing some fish, ancillary net data)
df1 <- data.frame(net=c(1,1,1,2,2,3),
                  eff=c(1,1,1,1,1,1),
                  species=c("BKT","LKT","RBT","BKT","LKT","RBT"),
                  catch=c(3,4,5,5,4,3))
df1
# not all 1s
xtabs(~net+species,data=df1)

df1mod1 <- addZeroCatch(df1,"net","species",zerovar="catch")
df1mod1
# check, should all be 3
xtabs(~net,data=df1mod1)
# check, should all be 1
xtabs(~net+species,data=df1mod1)
# correct mean/sd of catches
Summarize(catch~species,data=df1mod1)
# incorrect mean/sd of catches (no zeros)
Summarize(catch~species,data=df1)

# Same as example 1 but with no ancillary data specific to the net number
df2 <- df1[,-2]
df2
df1mod2 <- addZeroCatch(df2,"net","species",zerovar="catch")
df1mod2
# check, should all be 1
xtabs(~net+species,data=df1mod2)

## Example Data #3 (All nets have same species ... no zeros needed)
df3 <- data.frame(net=c(1,1,1,2,2,2,3,3,3),
                  eff=c(1,1,1,1,1,1,1,1,1),
                  species=c("BKT","LKT","RBT","BKT","LKT",
                            "RBT","BKT","LKT","RBT"),
                  catch=c(3,4,5,5,4,3,3,2,7))
df3
# should all be 1 for this example
xtabs(~net+species,data=df3)

# should receive a warning and table should still all be 1
df3mod1 <- addZeroCatch(df3,"net","species",zerovar="catch")
xtabs(~net+species,data=df3mod1)

## Example Data #4 (another variable that needs zeros)
df4 <- df1
df4$recaps <- c(0,0,0,1,2,1)
df4
# not all 1s
xtabs(~net+species,data=df4)

df4mod1 <- addZeroCatch(df4,"net","species",zerovar=c("catch","recaps"))
# note zeros in both variables
df4mod1
# check, should all be 1
xtabs(~net+species,data=df4mod1)
# observe difference from next
Summarize(catch~species,data=df4)
Summarize(catch~species,data=df4mod1)
# observe difference from next
Summarize(recaps~species,data=df4)
Summarize(recaps~species,data=df4mod1)

## Example Data #5 (two "specvar"s)
df5 <- df1
df5$sex <- c("m","m","f","m","f","f")
df5
# not all 1s
xtabs(~sex+species+net,data=df5)

df5mod1 <- addZeroCatch(df5,"net",c("species","sex"),zerovar="catch")
df5mod1
# all 1s
xtabs(~sex+species+net,data=df5mod1)
str(df5mod1) 

## Example Data #6 (three "specvar"s)
df6 <- df5
df6$size <- c("lrg","lrg","lrg","sm","lrg","sm")
df6

df6mod1 <- addZeroCatch(df6,"net",c("species","sex","size"),zerovar="catch")
df6mod1
 



