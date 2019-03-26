## ---- eval = F-----------------------------------------------------------
#  library(RISmed)
#  
#  # Store the input string for reuse
#  search_topic <- "anaphylaxis genetics"
#  search_query <- EUtilsSummary(search_topic, mindate=2014, maxdate=2015)
#  
#  summary(search_query)
#  
#  pull <- EUtilsGet(search_query)
#  
#  data <- data.frame('Abstracts' = AbstractText(pull))
#  
#  # Get rid of first entry for some reason, seems to always be blank
#  data[,1] <- as.character(data[,1])
#  data <- data[-1,]
#  
#  head(data)

## ---- eval = F-----------------------------------------------------------
#  # Store the input string for reuse
#  search_topic <- "immunology genetics"
#  search_query <- EUtilsSummary(search_topic, # Find all articles matching the string
#                                mindate=2014, # From 2014
#                                maxdate=2015, # to 2015
#                                retmax = 1000)  # This is the default but explicit
#  
#  summary(search_query)
#  
#  pull_control <- EUtilsGet(search_query)
#  
#  control <- data.frame('Abstracts' = AbstractText(pull_control))
#  
#  # Get rid of first entry for some reason, seems to always be blank
#  control[,1] <- as.character(control[,1])
#  control <- control[-1,]
#  
#  head(control)

## ---- eval = F-----------------------------------------------------------
#   data(package = "goldi", "TDM.go.df")
#    TDM.go.df <- TDM.go.df[, !duplicated(colnames(TDM.go.df))]
#  
#    lims <- c(1,2,2,3,4,5,6,7,7,8,10)
#  
#    results <- list()
#  
#    for(i in 1:length(data)){
#  
#      if(!data[i] == ""){
#        results[[i]] <- goldi(doc = data[i],
#              terms = terms,
#              lims = lims,
#              syn = F,
#              object = T,
#              log = "/dev/null",
#              reader = "local",
#              output = "/dev/null",
#              term_tdm = TDM.go.df)
#      }
#    }
#  
#    results <- do.call("rbind", results)
#  
#    control_results <- list()
#  
#    for(i in 1:length(control)){
#      if(!control[i] == ""){
#        control_results[[i]] <- goldi(doc = control[i],
#              terms = terms,
#              lims = lims,
#              syn = F,
#              object = T,
#              log = "/dev/null",
#              reader = "local",
#              output = "/dev/null",
#              term_tdm = TDM.go.df)
#      }
#    }
#    control_results <- do.call("rbind", control_results)

## ---- eval = F-----------------------------------------------------------
#  goldi::enrichment(target = results,
#                    control = control_results
#                    threshold = 5)

