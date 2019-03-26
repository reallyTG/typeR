library(rgbif)


### Name: nodes
### Title: Nodes metadata.
### Aliases: nodes

### ** Examples

## Not run: 
##D nodes(limit=5)
##D nodes(uuid="1193638d-32d1-43f0-a855-8727c94299d8")
##D nodes(data='identifier', uuid="03e816b3-8f58-49ae-bc12-4e18b358d6d9")
##D nodes(data=c('identifier','organization','comment'),
##D   uuid="03e816b3-8f58-49ae-bc12-4e18b358d6d9")
##D 
##D uuids = c("8cb55387-7802-40e8-86d6-d357a583c596",
##D   "02c40d2a-1cba-4633-90b7-e36e5e97aba8",
##D   "7a17efec-0a6a-424c-b743-f715852c3c1f",
##D   "b797ce0f-47e6-4231-b048-6b62ca3b0f55",
##D   "1193638d-32d1-43f0-a855-8727c94299d8",
##D   "d3499f89-5bc0-4454-8cdb-60bead228a6d",
##D   "cdc9736d-5ff7-4ece-9959-3c744360cdb3",
##D   "a8b16421-d80b-4ef3-8f22-098b01a89255",
##D   "8df8d012-8e64-4c8a-886e-521a3bdfa623",
##D   "b35cf8f1-748d-467a-adca-4f9170f20a4e",
##D   "03e816b3-8f58-49ae-bc12-4e18b358d6d9",
##D   "073d1223-70b1-4433-bb21-dd70afe3053b",
##D   "07dfe2f9-5116-4922-9a8a-3e0912276a72",
##D   "086f5148-c0a8-469b-84cc-cce5342f9242",
##D   "0909d601-bda2-42df-9e63-a6d51847ebce",
##D   "0e0181bf-9c78-4676-bdc3-54765e661bb8",
##D   "109aea14-c252-4a85-96e2-f5f4d5d088f4",
##D   "169eb292-376b-4cc6-8e31-9c2c432de0ad",
##D   "1e789bc9-79fc-4e60-a49e-89dfc45a7188",
##D   "1f94b3ca-9345-4d65-afe2-4bace93aa0fe")
##D 
##D res <- lapply(uuids, function(x) nodes(x, data='identifier')$data)
##D res <- res[!sapply(res, NROW)==0]
##D res[1]
##D 
##D # Pass on curl options
##D nodes(limit=20, curlopts=list(verbose=TRUE))
## End(Not run)



