library(libamtrack)


### Name: AT.SPC.tapply
### Title: AT.SPC.tapply
### Aliases: AT.SPC.tapply

### ** Examples

## Not run: 
##D # Load required libraries
##D require(libamtrack)
##D require(lattice)
##D # Use example data set
##D file.name 	       <- system.file("extdata",
##D  "libamtrack.12C.H2O.active3.MeV27000.zip", package = "libamtrack")
##D endian                 <- c("big", "little")[2]
##D # Read in spc data, we use old style R reader, so endianess has to be given
##D spc                    <- AT.SPC.read ( file.name = file.name,
##D                                         endian    = endian,
##D                                         flavour   = "vanilla")$spc
##D # Translate particle numbers in particle names (looks better)
##D spc$particle.name      <- AT.particle.name.from.particle.no(particle.no =
##D  spc$particle.no)
##D spc$particle.name      <- factor(spc$particle.name)
##D 										
##D # Compute and plot dose per primary with depth from spc data 
##D df1 <- AT.SPC.tapply( spc                   = spc, 
##D                       INDEX                 = "depth.g.cm2", 
##D                       FUN                   = AT.total.D.Gy, 
##D                       additional.arguments  = list( c("material.no", "1",
##D  FALSE),                   # Water
##D                                                    
##D  c("stopping.power.source.no", "0", FALSE)),     # PSTAR
##D                       names.results         = "D.Gy")
##D xyplot( D.Gy ~ depth.g.cm2,
##D         df1,
##D         type = "o",
##D 		grid = TRUE,
##D         ylab = "dose per primary / Gy",
##D         xlab = "depth / (g/cm2)")
##D # Compute and plot dose (1 Gy entrance) with depth from spc data 
##D # To do so, first the fluence per primary has to be scaled and then
##D 
##D # AT.SPC.tapply has to be referred to the new non-standard column (default:
##D # fluence.cm2 = "N.per.primary")
##D fluence.factor  <- 1.0 / df1$D.Gy[1]                  
##D # factor between dose per primary (from above) and 2 Gy
##D spc$fluence.cm2 <- spc$N.per.primary * fluence.factor
##D df2 <- AT.SPC.tapply( spc                   = spc, 
##D   INDEX                 = "depth.g.cm2", 
##D   FUN                   = AT.total.D.Gy,
##D   mixed.field.arguments = list( fluence.cm2 = "fluence.cm2", 
##D                                 E.MeV.u     = "E.mid.MeV.u", 
##D                                 particle.no = "particle.no"),
##D   additional.arguments  = list( c("material.no", 
##D                                   "1", 
##D                                   FALSE), # Water
##D                                 c("stopping.power.source.no",
##D                                   "0", FALSE)), # PSTAR
##D   names.results         = "D.Gy")
##D xyplot( D.Gy ~ depth.g.cm2,
##D         df2,
##D         type = "o",
##D 	col  = "red",
##D         grid = TRUE,
##D 	ylab = "dose / Gy",
##D         xlab = "depth / (g/cm2)")
##D 			   
##D 			   
##D # Compute and plot the dose with depth, but differentiate contribution
##D # from individual particle species
##D # Also: use nicer (human-readable) code for material
##D df3  <- AT.SPC.tapply( spc                  = spc, 
##D   INDEX                = c("depth.g.cm2", "particle.name"),  
##D   FUN                  = AT.total.D.Gy, 
##D   additional.arguments = list(c("material.no", 
##D                                 "AT.material.no.from.material.name('Water,
##D  Liquid')", 
##D                                 FALSE),
##D                               c("stopping.power.source.no", 
##D                                 "0", 
##D                                 FALSE)),
##D                        names.results        = "D.Gy")
##D xyplot( log10(D.Gy) ~ depth.g.cm2,
##D         df3,
##D         groups      = particle.name,
##D         type     	= 'o',
##D         grid        = TRUE,
##D         auto.key    = list(space = 'right'),
##D         ylab        = "log10( dose per primary / Gy )",
##D         xlab        = 'depth / (g/cm2)')
## End(Not run)



