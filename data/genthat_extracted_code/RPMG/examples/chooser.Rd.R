library(RPMG)


### Name: chooser
### Title: Iteractive Selection Winder
### Aliases: chooser
### Keywords: iplot

### ** Examples

## Not run: 
##D  k = letters[1:26]
##D     
##D pk = chooser(opts=k , nsel=3 )
##D 
##D print(pk)
##D 
##D 
##D  k = c( 1:26, letters[1:26])
##D     
##D pk = chooser(opts=k , nsel=3 )
##D 
##D print(pk)
##D 
##D 
##D k = 1:12
##D     
##D pk = chooser(opts=k , nsel=3 )
##D 
##D print(pk)
##D ##################
##D 
##D plot(runif(10, 1, 100), runif(10, 1, 100), type='n')
##D 
##D APAL = c('tan2','red2','lightpink3','chocolate4','blue3','thistle4',
##D   'lightcyan4',
##D    'orangered1','purple4','darkred',
##D    'dodgerblue1','gold3','chartreuse',
##D    'sienna4')
##D 
##D ##   nchar( APAL )
##D wm = which.max(nchar( APAL ))
##D swidth = strwidth(APAL[wm])
##D 
##D 
##D upar = par("usr")
##D 
##D mhgt = sum( strheight(APAL )+0.5*strheight(APAL ))
##D 
##D mwid = max( strwidth(APAL) )
##D 
##D mwid = mwid + 0.05*mwid
##D 
##D chooser(opts=APAL  , ncol=1, nsel=NA, newdev=FALSE, STAY=TRUE,
##D            newplot=FALSE, xlim=c(upar[1], upar[1]+mwid) ,
##D        ylim=c( (upar[4]-mhgt),upar[4]) , main=""  )
##D 
##D 
## End(Not run)






