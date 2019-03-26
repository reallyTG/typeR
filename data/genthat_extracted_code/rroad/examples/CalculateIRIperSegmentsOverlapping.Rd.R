library(rroad)


### Name: CalculateIRIperSegmentsOverlapping
### Title: Computes the IRI for fixed length overlapping segments (e.g. 100
###   m segments) with an offset (e.g. 20 m) given a road profile
### Aliases: CalculateIRIperSegmentsOverlapping

### ** Examples

profile <- rnorm(10000)
iri <- CalculateIRIperSegments(profile, IRI_COEF_100, 20)
par(mfrow = c(1,2))
plot(profile, type="l",
   xlab="Distance [dm]", ylab="Profile [m]",
   main="Read profile (Laser measurement)")
plot(iri, type="s",
   xlab="Segment (with 20 m offset)", ylab="IRI [m/km]",
   main="International Roughness Index (IRI)\nsample = 10cm, segment = 20m")



