library(aqp)


### Name: ca630
### Title: Soil Data from the Central Sierra Nevada Region of California
### Aliases: ca630
### Keywords: datasets

### ** Examples

## Not run: 
##D library(plyr)
##D library(lattice)
##D library(Hmisc)
##D library(maps)
##D library(sp)
##D 
##D # check the data out:
##D data(ca630)
##D str(ca630)
##D 
##D # note that pedon_key is the link between the two tables
##D 
##D # make a copy of the horizon data
##D ca <- ca630$lab
##D 
##D # promote to a SoilProfileCollection class object
##D depths(ca) <- pedon_key ~ hzn_top + hzn_bot
##D 
##D # add site data, based on pedon_key
##D site(ca) <- ca630$site
##D 
##D # ID data missing coordinates: '|' is a logical OR
##D (missing.coords.idx <- which(is.na(ca$lat) | is.na(ca$lon)))
##D 
##D # remove missing coordinates by safely subsetting
##D if(length(missing.coords.idx) > 0)
##D 	ca <- ca[-missing.coords.idx, ]
##D 
##D # register spatial data
##D coordinates(ca) <- ~ lon + lat
##D 
##D # assign a coordinate reference system
##D proj4string(ca) <- '+proj=longlat +datum=NAD83'
##D 
##D # check the result
##D print(ca)
##D 
##D # map the data (several ways to do this, here is a simple way)
##D map(database='county', region='california')
##D points(coordinates(ca), col='red', cex=0.5)
##D 
##D # aggregate %BS 7 for all profiles into 1 cm slices
##D a <- slab(ca, fm= ~ bs_7)
##D 
##D # plot median & IQR by 1 cm slice
##D xyplot(
##D top ~ p.q50, data=a, lower=a$p.q25, upper=a$p.q75, 
##D ylim=c(160,-5), alpha=0.5, scales=list(alternating=1, y=list(tick.num=7)),
##D panel=panel.depth_function, prepanel=prepanel.depth_function,
##D ylab='Depth (cm)', xlab='Base Saturation at pH 7', 
##D par.settings=list(superpose.line=list(col='black', lwd=2))
##D )
##D 
##D # aggregate %BS at pH 8.2 for all profiles by MLRA, along 1 cm slices
##D # note that mlra is stored in @site
##D a <- slab(ca, mlra ~ bs_8.2)
##D 
##D # keep only MLRA 18 and 22
##D a <- subset(a, subset=mlra %in% c('18', '22'))
##D 
##D # plot median & IQR by 1 cm slice, using different colors for each MLRA
##D xyplot(
##D top ~ p.q50, groups=mlra , data=a, lower=a$p.q25, upper=a$p.q75, 
##D ylim=c(160,-5), alpha=0.5, scales=list(y=list(tick.num=7, alternating=3), x=list(alternating=1)),
##D panel=panel.depth_function, prepanel=prepanel.depth_function,
##D ylab='Depth (cm)', xlab='Base Saturation at pH 8.2', 
##D par.settings=list(superpose.line=list(col=c('black','blue'), lty=c(1,2), lwd=2)),
##D auto.key=list(columns=2, title='MLRA', points=FALSE, lines=TRUE)
##D )
##D 
##D 
##D # safely compute hz-thickness weighted mean CEC (pH 7)
##D # using data.frame objects
##D head(lab.agg.cec_7 <- ddply(ca630$lab, .(pedon_key), 
##D .fun=summarise, CEC_7=wtd.mean(bs_7, weights=hzn_bot-hzn_top)))
##D 
##D # extract a SPDF with horizon data along a slice at 25 cm
##D s.25 <- slice(ca, fm=25 ~ bs_7 + CEC7 + ex_acid)
##D spplot(s.25, zcol=c('bs_7','CEC7','ex_acid'))
##D 
##D # note that the ordering is preserved:
##D all.equal(s.25$pedon_key, profile_id(ca))
##D 
##D # extract a data.frame with horizon data at 10, 20, and 50 cm
##D s.multiple <- slice(ca, fm=c(10,20,50) ~ bs_7 + CEC7 + ex_acid)
##D 
##D # Extract the 2nd horizon from all profiles as SPDF
##D ca.2 <- ca[, 2]
##D 
##D # subset profiles 1 through 10
##D ca.1.to.10 <- ca[1:10, ]
##D 
##D # basic plot method: profile plot
##D plot(ca.1.to.10, name='hzn_desgn')
## End(Not run)



