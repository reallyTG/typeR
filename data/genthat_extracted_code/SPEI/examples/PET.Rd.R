library(SPEI)


### Name: Potential evapotranspiration
### Title: Computation of potential evapotranspiration.
### Aliases: thornthwaite hargreaves penman

### ** Examples

# Load data for Tampa, lat=37.6475N, elevation=402.6 m. a.s.l.
# Data consists on monthly values since January 1980
data(wichita)
attach(wichita)
names(wichita)

# PET according to Thornthwaite
tho <- thornthwaite(TMED,37.6475)
# Hargreaves
har <- hargreaves(TMIN,TMAX,lat=37.6475)
# Penman, based on sun hours, ignore NAs
pen <- penman(TMIN,TMAX,AWND,tsun=TSUN,lat=37.6475,z=402.6,na.rm=TRUE)
# Penman, based on cloud cover
pen2 <- penman(TMIN,TMAX,AWND,CC=ACSH,lat=37.6475,z=402.6,na.rm=TRUE)
# Plot them together
plot(cbind(tho,har,pen,pen2))

# Now consider the data started in June 1900
thornthwaite(ts(TMED,start=c(1900,6),frequency=12),37.6475)

# Comparison with example from Allen et al. (1998), p. 69, fig. 18:
# Data from Cabinda, Angola (-5.33S, 12.11E, 20 m a.s.l.)
data(cabinda)
pen.cab <- penman(cabinda$Tmin,cabinda$Tmax,cabinda$U2,
	Rs=cabinda$Rs,tsun=cabinda$tsun,RH=cabinda$RH,lat=-5.33,z=20)
plot(cabinda$ET0,pen.cab)
abline(0,1,lt='dashed')
summary(lm(pen.cab~cabinda$ET0))$r.squared



