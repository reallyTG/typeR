library(BlockMessage)


### Name: BlockMessage-package
### Title: Messages in 8 by 8 block letters
### Aliases: BlockMessage-package BlockMessage
### Keywords: package

### ** Examples

  cat(paste(blockMessage("Finishing 15:01:45"), collapse="\n"), "\n")
  cat("\n", paste(paste(rep(" ", 20), collapse=""), 
      blockMessage("Finishing 15:01:45", portrait=FALSE, repeats=3, rotate=180, width=6),
  	  collapse="\n"), "\n")
  cat(paste(c(blockMessage("Finishing"),"\n",blockMessage("15:01:45")), collapse="\n"), "\n")



