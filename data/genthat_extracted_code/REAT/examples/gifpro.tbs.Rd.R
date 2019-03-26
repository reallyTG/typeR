library(REAT)


### Name: gifpro.tbs
### Title: Trend-based and location-specific commercial area prognosis
### Aliases: gifpro.tbs

### ** Examples

# Data for Goettingen:
data(Goettingen)

anteileGOE <- rep(100,15)
nvquote <- rep (0.3, 15)
vlquote <- rep (0.7, 15)

gifpro.tbs (e_ij = Goettingen[2:16,3:12], 
a_i = anteileGOE, sq_ij = nvquote,
rq_ij = vlquote, tinterval = 12, prog.func = 
rep("lin", nrow(Goettingen[2:16,3:12])),
ai_ij = 150, time.base = 2008, output = "full",
industry.names = Goettingen$WZ2008_Code[2:16],
prog.plot = TRUE, plot.single = FALSE)



