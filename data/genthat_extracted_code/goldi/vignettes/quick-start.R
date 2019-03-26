## ---- eval = F-----------------------------------------------------------
#  # Give the free form text
#  doc <- "In this sentence we will talk about ribosomal chaperone activity. In this sentence we will talk about nothing. Here we discuss obsolete molecular terms."
#  
#  # Load in the included term document matrix for the terms
#  data("TDM.go.df")
#  
#  # Pipe output and log to /dev/null
#  output = "/dev/null"
#  log = "/dev/null"
#  
#  # Run the function
#  goldi(doc = doc,
#    term_tdm = TDM.go.df,
#    output = output,
#    log = log,
#    object = TRUE)

