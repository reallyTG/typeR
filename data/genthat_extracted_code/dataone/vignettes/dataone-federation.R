## ---- eval=F-------------------------------------------------------------
#  libary(dataone)
#  am <- AuthenticationManager()
#  getTokenInfo(am)

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("PROD")
#  unlist(lapply(listNodes(cn), function(x) x@name))

## ----eval=F--------------------------------------------------------------
#  cn@endpoint

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("STAGING2")
#  unlist(lapply(listNodes(cn), function(x) x@name))

