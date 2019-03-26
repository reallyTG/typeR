## ----eval=F--------------------------------------------------------------
#  library(dataone)
#  cn <- CNode("PROD")
#  queryParamList <- list(q="id:doi*", rows="5", fq="abstract:carbon", fl="id,title,dateUploaded,abstract,datasource,size")
#  result <- query(cn, solrQuery=queryParamList, as="list")

## ----eval=F--------------------------------------------------------------
#  result[[1]]$title

## ----eval=F--------------------------------------------------------------
#  ids <- lapply(result, function(x) {
#    message(sprintf("id: %s", x$id))
#    message(sprintf("origin member node: %s", x$datasource))
#    message(sprintf("title: %s", x$title))
#    message(sprintf("date uploaded: %s", x$dateUploaded))
#    x$id
#  })

## ----eval=F--------------------------------------------------------------
#  cn <- CNode("PROD")
#  result <- query(cn, queryParamList, as="data.frame", parse=FALSE)

## ---- eval=F-------------------------------------------------------------
#  result[,'id']

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("PROD")
#  mn <- getMNode(cn, "urn:node:KNB")
#  mySearchTerms <- list(abstract="kelp", attribute="biomass")
#  result <- query(cn, searchTerms=mySearchTerms, as="data.frame")

## ---- eval=F-------------------------------------------------------------
#  # Query the data holdings on a member node
#  cn <- CNode("PROD")
#  mn <- getMNode(cn, "urn:node:KNB")
#  queryParams <- list(q="abstract:habitat", fl="id,title,abstract")
#  result <- query(mn, queryParams, as="data.frame", parse=FALSE)
#  # Choose the first matchin PID
#  pid <- result[1,'id']

## ----eval=F--------------------------------------------------------------
#  cn <- CNode("PROD")
#  queryParams <- 'q=id:*&fl=id,title&fq=datasource:"urn:node:KNB"&rows=5'
#  result <- query(cn, queryParams, as="data.frame", parse=FALSE)
#  result[,'id']

