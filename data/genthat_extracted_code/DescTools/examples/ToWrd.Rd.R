library(DescTools)


### Name: ToWrd
### Title: Send Objects to Word
### Aliases: ToWrd ToWrd.table ToWrd.ftable ToWrd.character ToWrd.lm
###   ToWrd.TOne ToWrd.Freq ToWrd.default ToWrd.data.frame
### Keywords: print

### ** Examples

## Not run: 
##D # we can't get this through the CRAN test - run it with copy/paste to console
##D 
##D wrd <- GetNewWrd()
##D ToWrd("This is centered Text in Arial Black\n",
##D       para=list(Alignment=wdConst$wdAlignParagraphCenter,
##D                 SpaceBefore=3, SpaceAfter=6),
##D       font=list(name="Arial Black", size=14),
##D       wrd=wrd)
##D 
##D sel <- wrd$Selection()$Borders(wdConst$wdBorderBottom)
##D sel[["LineStyle"]] <- wdConst$wdLineStyleSingle
##D 
##D 
##D t1 <- TOne(x = d.pizza[, c("temperature","delivery_min","driver","wine_ordered")],
##D            grp=d.pizza$wine_delivered)
##D 
##D ToWrd(t1, font=list(name="Algerian"), wrd=wrd)
##D 
##D 
##D tab <- table(d.pizza$driver, d.pizza$area)
##D 
##D tab <- table(d.pizza$driver, d.pizza$area)
##D ToWrd(tab, font = list(size=15, name="Arial"), row.names = TRUE, col.names = TRUE,
##D       main= "my Title", wrd=wrd)
##D ToWrd(tab, font = list(size=10, name="Arial narrow"),
##D       row.names = TRUE, col.names=FALSE, wrd=wrd)
##D ToWrd(tab, font = list(size=15, name="Arial"), align="r",
##D       row.names = FALSE, col.names=TRUE, wrd=wrd)
##D ToWrd(tab, font = list(size=15, name="Arial"),
##D       row.names = FALSE, col.names=FALSE, wrd=wrd)
##D 
##D ToWrd(tab, tablestyle = "Mittlere Schattierung 2 - Akzent 4",
##D       row.names=TRUE, col.names=TRUE, wrd=wrd)
##D 
##D ToWrd(Format(tab, big.mark = "'", digits=0), wrd=wrd)
##D 
##D zz <- ToWrd(Format(tab, big.mark = "'", digits=0), wrd=wrd)
##D zz$Rows(1)$Select()
##D WrdFont(wrd = wrd) <- list(name="Algerian", size=14, bold=TRUE)
## End(Not run)



