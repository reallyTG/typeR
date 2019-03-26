library(DescTools)


### Name: ConnLines
### Title: Add Connection Lines to a Barplot
### Aliases: ConnLines
### Keywords: aplot

### ** Examples

tab <- with(
  subset(d.pizza, driver %in% c("Carpenter","Miller","Farmer","Butcher")),
  table(factor(driver), Weekday(date, "dd", stringsAsFactor=TRUE))
)
tab

barplot(tab, beside=FALSE, space=1.2)
ConnLines(tab, beside=FALSE, space=1.2, lcol="grey50", lwd=1, lty=2)

barplot(tab, beside=FALSE, space=1.2, horiz=TRUE)
ConnLines(tab, beside=FALSE, space=1.2, horiz=TRUE, lcol="grey50", lwd=1, lty=2)


cols <- Pal("Helsana")[1:4]
b <- barplot(tab, beside=FALSE, horiz=FALSE, col=cols)
ConnLines(tab, beside=FALSE, horiz=FALSE, lcol="grey50", lwd=1, lty=2)

# set some labels
txt <- tab
txt[] <- gsub(pattern="^0", "", t(tab))       # do not print 0s
text(x=b, y=t(apply(apply(rbind(0,tab), 2, Midx), 2, cumsum)), labels=txt,
     col=(matrix(rep(TextContrastColor(cols), each=ncol(tab)),
          nrow=nrow(tab), byrow=FALSE )))

# align to the middle of the bars
barplot(tab, beside=FALSE, space=1.2)
ConnLines(tab, beside=FALSE, space=1.2, lcol="grey50", lwd=1, lty=2, method="mid")



