library(Causata)


### Name: BinaryCut
### Title: Cuts a numeric independent variable into bins.
### Aliases: BinaryCut

### ** Examples

data(df.causata)
dv <- df.causata$has.responded.mobile.logoff_next.hour_466
iv <- df.causata$online.number.of.page.views_last.30.days_3
f <- BinaryCut(iv,dv)

# compute the weight of evidence for each bin
woe <- Woe(f, dv)

# adjust plot margins to increase space for bin labels
par(oma=c(1,8,1,1)) 

# plot the bins against the weight of evidence
barplot(woe$woe.levels, names.arg=levels(f), horiz=TRUE, las=1, 
  main="Weight of Evidence for clicking a banner for a mobile app.", 
  sub="WOE vs. Page View Count, Last 30 Days" )



