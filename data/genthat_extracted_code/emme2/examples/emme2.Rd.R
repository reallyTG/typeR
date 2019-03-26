library(emme2)


### Name: emme2
### Title: Read and Write to an EMME/2 databank
### Aliases: read.file0 read.file1 read.matdir read.ms read.mo read.md
###   read.mf write.mf read.link.data read.nodes plotLinks ftnode formatMf
###   get.emme2.time MFBatchFetch MFFetch MFDir
### Keywords: programming

### ** Examples

     ## Not run: 
##D      # Function call to create databank offset file0
##D      file0 <- read.file0("emme2/emme2ban")
##D      
##D      #Function call to create file1 info (global parameters)
##D      file1 <- read.file1("emme2/emme2ban", file0)
##D      
##D      #Function call to read matrix directory
##D      mat.dir <- read.matdir("emme2/emme2ban", file0, file1$global["mmat"])
##D      
##D      #Function call to read all ms from databank
##D      ms <- read.ms("emme2/emme2ban", file0)
##D      
##D      #Function call to read mo2
##D      mo2 <- read.mo(2, "emme2/emme2ban", file0, file1$global["mcent"], mat.dir)
##D      
##D      #Function call to read md2
##D      md2 <- read.md(2, "emme2/emme2ban", file0, file1$global["mcent"], mat.dir)
##D      
##D      #Function call to read mf2
##D      mf2 <- read.mf(2, "emme2/emme2ban", file0, file1$global["mcent"], mat.dir)
##D      
##D      #Function call to read mf "opskim"
##D      mf2 <- read.mf("opskim", "emme2/emme2ban", file0, file1$global["mcent"], mat.dir)
##D      mf2 <- mf2[zonesUsed,zonesUsed] #To crop the padded default values
##D      
##D      #Function call to write mf2
##D      x <- matrix(rnorm(mf2), nrow(mf2), ncol(mf2)) #Random generate length(mf) numbers to write dummy data to bank
##D      x <- formatMf(x, file1) #Append the padded default values to the matrix 
##D      write.mf(x, 2, "emme2/emme2ban", file0, file1$global["mcent"], file1$global["mmat"], mat.dir, newname="test", newdesc="test matrix")
##D      
##D      #Function call to read link data
##D      link.data <- read.link.data("emme2/emme2ban", 1, file0, file1$global["mscen"], file1$global["mlink"], file1$global["mnode"])
##D      
##D      #Function call to create from to node link table
##D      tofrom <- ftnode(link.data[[1]], link.data[[2]], link.data[[3]], file1$global["mlink"])
##D      
##D      #Function call to create node table
##D      nodes <- read.nodes("emme2/emme2ban", 1, file0, file1$global["mscen"], file1$global["mlink"], file1$global["mnode"])
##D      
##D      #Function call to plot network
##D      plotLinks(tofrom, nodes, "Network")
##D      
##D      #Function call to format a mf to write to the databank
##D      mf2 <- formatMf(mf2, file1)
##D      
##D      #Convenience function to get a directory of a databank
##D      dir.df <- MFDir("emme2/emme2ban")
##D      
##D      #Convenience function to fetch and format an mf as a long data.frame
##D      mf.df <- MFFetch("emme2/emme2ban", "aau1tm", varlongname="my.descriptive.var.name")
##D      
##D      #Convenience function to fetch, format, and merge multiple mf as a long data.frame     
##D      mmf.df <- MFBatchFetch("emme2/emme2ban", c("aau1tm", "aau2tm"))
##D      
## End(Not run)



