library(DescTools)


### Name: WrdTableBorders
### Title: Draw Borders to a Word Table
### Aliases: WrdTableBorders
### Keywords: print

### ** Examples

## Not run: 
##D 
##D # create table
##D tab <- table(op=d.pizza$operator, area=d.pizza$area)
##D 
##D # send it to Word
##D wrd <- GetNewWrd()
##D wtab <- ToWrd(tab, wrd=wrd, tablestyle = NA)
##D 
##D # draw borders
##D WrdTableBorders(wtab, from=c(2,2), to=c(3,3), border=wdConst$wdBorderBottom, wrd=wrd)
##D WrdTableBorders(wtab, from=c(2,2), to=c(3,3), border=wdConst$wdBorderDiagonalUp, wrd=wrd)
##D 
##D # demonstrate linewidth and color
##D wtab <- ToWrd(tab, wrd=wrd, tablestyle = NA)
##D WrdTableBorders(wtab, col=RgbToLong(ColToRgb("olivedrab")),
##D                 lwd=wdConst$wdLineWidth150pt, wrd=wrd)
##D 
##D WrdTableBorders(wtab, border=wdConst$wdBorderBottom,
##D                 col=RgbToLong(ColToRgb("dodgerblue")),
##D                 lwd=wdConst$wdLineWidth300pt, wrd=wrd)
##D 
##D # use an R color in Word
##D RgbToLong(ColToRgb("olivedrab"))
##D 
##D # find a similar R-color for a Word color
##D ColToRgb(RgbToCol(LongToRgb(wdConst$wdColorAqua)))
## End(Not run)



