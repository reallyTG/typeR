library(Rsconctdply)


### Name: rsconctdply
### Title: Deploys Multiple Shiny Apps using Configuration File
### Aliases: rsconctdply

### ** Examples


## Not run: 
##D 
##D #Files on Web
##D rsconctdply("https://api.myjson.com/bins/o8k2s")
##D 
##D #Files available locally
##D rsconctdply("~/rconnect_dir.json")
##D 
##D Json file Format:
##D sample file name with structure: "rconnect_dir.json"
##D 
##D {
##D   "App1": {
##D     "Server_url": "https://example1.com:443",
##D     "Server_NAME": "example1",
##D     "account": "user1",
##D     "appDir": "~/location1/"
##D   },
##D   "App2": {
##D     "Server_url": "https://example2.com:123",
##D     "Server_NAME": "example2",
##D     "account": "user2",
##D     "appDir": "~/location2/"
##D   }
##D }
## End(Not run)



