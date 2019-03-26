library(bio3d)


### Name: aanma.pdbs
### Title: Ensemble Normal Mode Analysis with All-Atom ENM
### Aliases: aanma.pdbs

### ** Examples

## No test: 
  # Needs MUSCLE installed - testing excluded
  if(check.utility("muscle")) {

    ## Fetch PDB files and split to chain A only PDB files
    ids <- c("1a70_A", "1czp_A", "1frd_A", "1fxi_A", "1iue_A", "1pfd_A")
    files <- get.pdb(ids, split = TRUE, path = tempdir())
    
    ## Sequence Alignement
    aln <- pdbaln(files, outfile = tempfile())
    
    ## Read all pdb coordinates
    pdbs <- read.all(aln)

    ## Normal mode analysis on aligned data
    modes <- aanma(pdbs, rm.gaps=TRUE)
    
    ## Plot fluctuation data
    plot(modes, pdbs=pdbs)
    
    ## Cluster on Fluctuation similariy
    sip <- sip(modes)
    hc <- hclust(dist(sip))
    col <- cutree(hc, k=3)
    
    ## Plot fluctuation data
    plot(modes, pdbs=pdbs, col=col)
    
    ## RMSIP is pre-calculated
    heatmap(1-modes$rmsip)
    
    ## Bhattacharyya coefficient
    bc <- bhattacharyya(modes)
    heatmap(1-bc)

  }
## End(No test)



