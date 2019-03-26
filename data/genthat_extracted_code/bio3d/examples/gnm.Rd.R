library(bio3d)


### Name: gnm
### Title: Gaussian Network Model
### Aliases: gnm gnm.pdb gnm.pdbs

### ** Examples

   ## Fetch stucture
   pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
   
   ## Calculate normal modes
   modes <- gnm(pdb)
   
   ## Print modes
   print(modes)
   
   ## Plot modes
   plot(modes)




