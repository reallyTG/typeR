## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align = "center", out.width = "100%",
               fig.width = 5, fig.height = 5,
               dev.args = list(pointsize=10),
               par = TRUE, # needed for setting hook 
               collapse = FALSE, # collapse input & ouput code in chunks
               cache = FALSE,
               warning = FALSE, message = FALSE)
knit_hooks$set(par = function(before, options, envir)
  { if(before && options$fig.show != "none") 
       par(mar=c(4.1,4.1,1.1,1.1), mgp=c(3,1,0), tcl=-0.5)
})

