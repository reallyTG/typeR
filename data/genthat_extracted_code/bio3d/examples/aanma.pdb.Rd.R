library(bio3d)


### Name: aanma
### Title: All Atom Normal Mode Analysis
### Aliases: aanma aanma.pdb rtb

### ** Examples

## Not run: 
##D    # All-atom NMA takes relatively long time - Don't run by default.
##D 
##D    ## Fetch stucture
##D    pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
##D 
##D    ## Calculate all-atom normal modes
##D    modes.aa <- aanma(pdb, outmodes='noh')
##D 
##D    ## Calculate all-atom normal modes with RTB approximation
##D    modes.aa.rtb <- aanma(pdb, outmodes='noh', rtb=TRUE)
##D 
##D    ## Compare the two modes
##D    rmsip(modes.aa, modes.aa.rtb)
##D 
##D    ## Calculate C-alpha normal modes.
##D    modes <- aanma(pdb)
##D 
##D    ## Calculate C-alpha normal modes with reduced ENM.
##D    modes.cg <- aanma(pdb, reduced=TRUE)
##D 
##D    ## Calculate C-alpha normal modes with RTB approximation
##D    modes.rtb <- aanma(pdb, rtb=TRUE)
##D 
##D    ## Compare modes
##D    rmsip(modes, modes.cg)
##D    rmsip(modes, modes.rtb)
##D 
##D    ## Print modes
##D    print(modes)
##D 
##D    ## Plot modes
##D    plot(modes)
##D 
##D    ## Visualize modes
##D    #m7 <- mktrj.nma(modes, mode=7, file="mode_7.pdb", pdb=pdb)
## End(Not run)



