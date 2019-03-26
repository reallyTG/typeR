library(rroad)


### Name: CalculateIRIperSegments
### Title: Computes the IRI for fixed length segments (e.g. 100m segments)
###   given a road profile.
### Aliases: CalculateIRIperSegments

### ** Examples

profile <- rnorm(10000)
iri <- CalculateIRIperSegments(profile, IRI_COEF_100, 20)
par(mfrow = c(1,2))
plot(profile, type="l",
   xlab="Distance [dm]", ylab="Profile [m]",
   main="Read profile (Laser measurement)")
plot(iri, type="s",
   xlab="Segment", ylab="IRI [m/km]",
   main="International Roughness Index (IRI)\nsample = 10cm, segment = 20m")



