library(SARP.compo)


### Name: fichiers
### Title: Create and read a file of p-values for all pairwise tests of all
###   possible ratios of a compositional vector
### Aliases: fichier creer.Fp create.Fp grf.Fp
### Keywords: compositional

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute one-way ANOVA p-values for all ratios in this data set
   #  and store them in a text file
   creer.Fp( poteries, "fichier_test.csv",
             c( 'Al', 'Na', 'Fe', 'Ca', 'Mg' ),
             f.p = anva1.fpc, v.X = 'Site' )

   # Make a graphe from it and plot it
   plot( grf.Fp( "fichier_test.csv" ) )

   # The file is a simple text-file that can be read as a data.frame
   DFp <- read.table( "fichier_test.csv", header = TRUE, sep = ";", dec = "," )
   DFp  



