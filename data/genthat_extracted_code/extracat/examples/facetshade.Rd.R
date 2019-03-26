library(extracat)


### Name: facetshade
### Title: facetshade
### Aliases: facetshade

### ** Examples


# produces a modified data.frame mdata and returns:
# ggplot(data = mdata, mapping, ... ) + facet_grid(f)

require(scales)
require(ggplot2)

# facetshade object:
fs1 <- facetshade( data = olives, aes(x = palmitoleic, y = oleic),
	f = .~Region )

# only the background-data
fs1 + geom_point( colour = alpha(1, 0.2) )

# the actual data added in a second layer:
fs1 + geom_point( colour = alpha(1, 0.2) ) +
geom_point( data = olives )

# now again with colours:
fs1 + geom_point( colour = alpha(1, 0.2) ) +
geom_point( data = olives, aes(colour = Area) )

# a different geom for the background-plot:
fs1 + geom_density2d(colour=alpha(1,0.1)) +
geom_point( data = olives, aes(colour = Area) )
## Not run: 
##D # OPTION 2: specify geom in facetshade call:
##D fs1b <- facetshade( data = olives, aes(x = palmitoleic, y = oleic),
##D 	f = .~Region , geom = geom_point)
##D fs1b + geom_point(aes(colour = Area))
## End(Not run)


# compare with complement:
fs2 <- facetshade( data = olives, aes(x = palmitoleic, y = oleic),
	 f = .~Region , bg.all = FALSE)

fs2 + geom_density2d(colour=alpha(1,0.1)) +
geom_point( data = olives, aes(colour = Area) )
## Not run: 
##D # OPTION 2: specify geom in facetshade call:
##D fs2b <- facetshade( data = olives, aes(x = palmitoleic, y = oleic),
##D 	f = .~Region , geom = geom_density2d, bg.all = FALSE)
##D fs2b + geom_point(aes(colour = Area))
## End(Not run)


# a second dataset:
## Not run: 
##D data(EURO4PlayerSkillsSep11, package="SportsAnalytics")
##D e4 <- subset(EURO4PlayerSkillsSep11,Attack > 0 & Defence > 0)
##D 
##D 
##D fs3 <- facetshade( data = e4, aes(x = Attack, y = Defence),
##D 	f = .~Position , compare.all = TRUE)
##D 
##D fs3 + geom_point( colour = alpha(1, 0.1) ) +
##D geom_point( data = e4, aes(colour = Position) ,alpha=0.3)
##D 
##D fs3 + geom_bin2d( colour = alpha(1, 0.1) ) +
##D geom_point( data = e4, aes(colour = Position) ,alpha=0.3)
##D 
##D # now with two facet variables
##D fs4 <- facetshade( data = e4, aes(x = Attack, y = Defence),
##D 	f = Position~Side , compare.all = TRUE)
##D 
##D fs4 + geom_point( colour = alpha(1, 0.1) ) +
##D geom_point( data = e4, aes(colour = Position)) 
## End(Not run)

## Not run: 
##D library(FinCal)
##D sh13 <- get.ohlcs.google(symbols=c("AAPL","GOOG","IBM", "MSFT"),
##D start="2013-01-01",end="2013-12-31")
##D 
##D # OPTION 1 ------------
##D require(reshape2)
##D SH13 <- data.frame(date = as.Date(sh13$AAPL$date),
##D  sapply(sh13,"[" ,"close",USE.NAMES=TRUE))
##D 
##D names(SH13) <- c("date",names(sh13))
##D SH13[,-1] <- apply(SH13[,-1], 2, function(x) 100*x/x[1])
##D SH13am <- melt(SH13, id="date")
##D 
##D 
##D # OPTION 2 ------------ 
##D #SH13am <- do.call(rbind,
##D #		 mapply(function(z,y){
##D #		 		data.frame(
##D #		 			date = as.Date(z$date),
##D #		 			value = 100*z$close/z$close[1],
##D #		 			variable = y)
##D #		 } , z = sh13, y = names(sh13), SIMPLIFY = FALSE))
##D # ---------------------		
##D 
##D 
##D # original plot from GDAR:
##D ggplot(SH13am, aes(date, y=value, colour=variable,group=variable)) +
##D geom_line()+ xlab("") + ylab("") +
##D  theme(legend.position="bottom") +
##D  theme(legend.title=element_blank())
##D 
##D 
##D # facetshade:
##D # compare to "average" of others:
##D facetshade(SH13am,aes(x=date, y=value),f = .~variable, bg.all = FALSE) +
##D  geom_smooth(aes(x=date, y=value),method="loess",span = 1/28) +
##D  geom_line(data=SH13am,aes(colour=variable),show_guide=FALSE) +
##D  xlab("") + ylab("")
##D 
##D # compare to all others
##D facetshade(SH13am,aes(x=date, y=value),
##D  f = .~variable, bg.all = FALSE,keep.orig = TRUE) +
##D  geom_line(aes(x=date, y=value,group=orig.variable),colour = alpha(1,0.3)) +
##D  geom_line(data=SH13am,aes(colour=variable),show_guide=FALSE, size = 1.2) +
##D xlab("") + ylab("")
##D 
##D # --- parallel coordinates --- #
##D 
##D sc <- scale(olives[,3:10])
##D 
##D # OPT: order by var
##D ord <- order(apply(sc,2,sd))
##D sc <- sc[,ord]
##D 
##D require(scales)
##D # OPT: align at median
##D sc <- apply(sc,2,function(z) rescale_mid(z, mid = median(z,na.rm=TRUE))) 
##D 
##D 
##D 
##D require(reshape2)
##D require(ggplot2)
##D 
##D msc <- melt(sc) 
##D msc$Area <- olives$Area
##D  
##D 
##D f1 <- facetshade(msc,aes(x=Var2,y=value,group=Var1),f=.~Area, bg.all = FALSE)
##D f1+geom_line(alpha=0.05)+
##D geom_line(data=msc,aes(colour=Area),alpha=0.2)+
##D facet_wrap(f=~Area,nrow=3)
##D 
## End(Not run)
## Not run: 
##D 	# TESTCODE: instead of creating a new object
##D 	# a shade layer is added to an existing ggplot
##D 	# NOTE: function CHANGES the object!
##D 	
##D # highlighting + alpha
##D pp0 <- ggplot()+geom_point(data = olives,
##D  aes(x = palmitoleic, y = palmitic), colour = 2) + facet_wrap(~Area, ncol = 3)
##D 	extracat:::facetshade2(pp0, alpha = 0.1, colour = 1)	
##D 
##D # colours for both, alpha for shade	
##D pp1 <- ggplot()+geom_point(data = olives,
##D  aes(x = palmitoleic, y = oleic, colour = Area)) + facet_grid(.~Region)
##D 	extracat:::facetshade2(pp1, alpha = 0.1)
##D 	
##D # different geom and colour for shade	
##D pp2 <- ggplot()+geom_point(data = olives,
##D  aes(x = palmitoleic, y = oleic, colour = Area)) + facet_grid(.~Region)
##D 	extracat:::facetshade2(pp2, geom = geom_density2d,
##D 	 mapping = aes(colour = NULL), colour = 7)
##D 
##D # smooth over points shade with matching colours
##D pp3 <- ggplot()+geom_smooth(data = olives,
##D  aes(x = palmitoleic, y = oleic, colour = Region)) + facet_grid(.~Region)
##D 	extracat:::facetshade2(pp3, geom = geom_point,
##D 	 mapping = aes(colour = orig.Region), keep.orig = TRUE)
##D 			
## End(Not run)






