library(bio3d)


### Name: community.aln
### Title: Align communities from two or more networks
### Aliases: community.aln
### Keywords: analysis

### ** Examples

## No test: 
  # Needs MUSCLE installed - testing excluded
  if(check.utility("muscle")) {

    if (!requireNamespace("igraph", quietly = TRUE)) {
      message('Need igraph installed to run this example')
    } else {

    ## Fetch PDB files and split to chain A only PDB files
    ids <- c("1tnd_A", "1tag_A")
    files <- get.pdb(ids, split = TRUE, path = tempdir())
    
    ## Sequence Alignement
    pdbs <- pdbaln(files, outfile = tempfile())
    
    ## Normal mode analysis on aligned data
    modes <- nma(pdbs, rm.gaps=TRUE)
    
    ## Dynamic Cross Correlation Matrix
    cijs <- dccm(modes)$all.dccm
 
    ## Correlation Network
    nets <- cna(cijs, cutoff.cij=0.3)

    ## Align network communities
    nets.aln <- community.aln(nets)

    ## plot all-residue and coarse-grained (community) networks
    pdb <- pdbs2pdb(pdbs, inds=1, rm.gaps=TRUE)[[1]]
    op <- par(no.readonly=TRUE)

    # before alignment
    par(mar=c(0.1, 0.1, 0.1, 0.1), mfrow=c(2,2))
    invisible( lapply(nets, function(x) 
       plot(x, layout=layout.cna(x, pdb=pdb, k=3, full=TRUE)[, 1:2], 
               full=TRUE)) )
    invisible( lapply(nets, function(x) 
       plot(x, layout=layout.cna(x, pdb=pdb, k=3)[, 1:2])) )

    # after alignment
    par(mar=c(0.1, 0.1, 0.1, 0.1), mfrow=c(2,2))
    invisible( lapply(nets.aln, function(x) 
       plot(x, layout=layout.cna(x, pdb=pdb, k=3, full=TRUE)[, 1:2], 
               full=TRUE)) )
    invisible( lapply(nets.aln, function(x) 
       plot(x, layout=layout.cna(x, pdb=pdb, k=3)[, 1:2])) )

    par(op)     

    }
  }
## End(No test)



