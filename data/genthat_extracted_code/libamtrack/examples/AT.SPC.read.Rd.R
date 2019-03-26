library(libamtrack)


### Name: AT.SPC.read
### Title: AT.SPC.read
### Aliases: AT.SPC.read

### ** Examples

## Not run: 
##D # Load required libraries
##D require(libamtrack)
##D require(lattice)
##D # Use example data set
##D file.name <- system.file("extdata", "libamtrack.12C.H2O.active3.MeV27000.zip",
##D  package = "libamtrack")
##D endian    <- c("big", "little")[2]
##D # Read in spc data, we use old style R reader, so endianess has to be given
##D spc                    <- AT.SPC.read ( file.name = file.name,
##D                                         endian    = endian,
##D                                         flavour   = "vanilla")$spc
##D # Get name and Z of particles in spectrum
##D spc$particle.name      <- AT.particle.name.from.particle.no(particle.no =
##D  spc$particle.no)
##D spc$particle.name      <- factor(spc$particle.name, levels =
##D  unique(spc$particle.name))
##D spc$Z                  <- AT.Z.from.particle.no(particle.no =
##D  spc$particle.no)$Z
##D                                    
##D #####################################################################
##D # Plot parts of spectra
##D ii      <- spc$depth.step##D 
##D 
##D #xyplot( log10(dN.dE.per.MeV.u.per.primary) ~ E.mid.MeV.u|sprintf("##D 
##D # depth.step),
##D #        spc[ii,],
##D #        type        = 's',
##D #        subset      = log10(dN.dE.per.MeV.u.per.primary) >= -4,
##D #        groups      = particle.name,
##D #        as.table    = TRUE,
##D #        ylab        = 'log (fluence per primary per bin width / (1/MeV.u)',
##D #        xlab        = 'kinetic energy / MeV.u',
##D #        auto.key    = list(space = 'right', lines = TRUE, points = FALSE),
##D #        main        = 'Energy spectra at selected depth steps')
##D #####################################################################
##D # Process data, compute total dose and dose-weighted LET with depth
##D df.total                <- AT.SPC.tapply( spc                  = spc, 
##D                                           INDEX                =
##D  "depth.g.cm2", 
##D                                           FUN                  =
##D  AT.total.D.Gy, 
##D                                           additional.arguments =
##D  list(c("material.no", "AT.material.no.from.material.name('Water, Liquid')",
##D  FALSE),
##D                                                                      
##D  c("stopping.power.source.no", "0", FALSE)),
##D                                           names.results        = "D.Gy")
##D df.total$LET.MeV.cm2.g  <- AT.SPC.tapply( spc                  = spc, 
##D                                           INDEX                =
##D  "depth.g.cm2", 
##D                                           FUN                  =
##D  AT.dose.weighted.LET.MeV.cm2.g,
##D                                           additional.arguments =
##D  list(c("material.no", "AT.material.no.from.material.name('Water, Liquid')",
##D  FALSE),
##D                                                                      
##D  c("stopping.power.source.no", "0", FALSE)))$returnValue
##D df.total$fLET.MeV.cm2.g <- AT.SPC.tapply( spc                  = spc, 
##D                                           INDEX                =
##D  "depth.g.cm2", 
##D                                           FUN                  =
##D  AT.fluence.weighted.LET.MeV.cm2.g,
##D                                           additional.arguments =
##D  list(c("material.no", "AT.material.no.from.material.name('Water, Liquid')",
##D  FALSE),
##D                                                                      
##D  c("stopping.power.source.no", "0", FALSE)))$returnValue
##D df.total$Mean.E.C.MeV.u <- AT.SPC.tapply( spc                  =
##D  spc[spc$particle.no == 6012,], 
##D                                           INDEX                =
##D  "depth.g.cm2", 
##D                                           FUN                  =
##D  AT.dose.weighted.E.MeV.u,
##D                                           additional.arguments =
##D  list(c("material.no", "AT.material.no.from.material.name('Water, Liquid')",
##D  FALSE),
##D                                                                      
##D  c("stopping.power.source.no", "0", FALSE)))$returnValue
##D xyplot( D.Gy ~ depth.g.cm2,
##D         df.total,
##D         grid        = TRUE,
##D         type        = 'o',
##D         ylab        = 'total dose / Gy',
##D         xlab        = 'depth / (g/cm2)')
##D xyplot( LET.MeV.cm2.g + fLET.MeV.cm2.g ~ depth.g.cm2,
##D         df.total,
##D         type        = 'o',
##D         main        = 'Fluence (fLET) and dose (LET) weighted LET',
##D         grid        = TRUE,
##D         auto.key    = list(space = 'right', lines = TRUE, points = FALSE),
##D         ylab        = 'LET / (MeV*cm2/g)',
##D         xlab        = 'depth / (g/cm2)')
##D xyplot( Mean.E.C.MeV.u ~ depth.g.cm2,
##D         df.total,
##D         type        = 'o',
##D         grid        = TRUE,
##D         main        = file.name,
##D         ylab        = 'Average kinetic energy of C / (MeV/u)',
##D         xlab        = 'depth / (g/cm2)')
## End(Not run)



