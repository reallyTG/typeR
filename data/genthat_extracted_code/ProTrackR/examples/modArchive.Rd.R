library(ProTrackR)


### Name: modArchive
### Title: ModArchive helper functions
### Aliases: modArchive modArchive.info modArchive.download
###   modArchive.search.mod modArchive.request.count
###   modArchive.max.requests modArchive.view.by modArchive.search.genre
###   modArchive.search.artist modArchive.search.hash
###   modArchive.random.pick

### ** Examples

## Not run: 
##D ## most of the example below will fail as they require a
##D ## real modArchive API key. The key used in these example
##D ## is just a dummy. See details on how to get a key
##D ## in the section 'ModArchive API Key' in the manual.
##D 
##D ## Search for the module that is also used as
##D ## an example in this package:
##D search.results <- modArchive.search.mod("*_-_intro.mod",
##D                                         size.filter = "0-99",
##D                                         format.filter = "MOD",
##D                                         api.key = "<your key here>")
##D 
##D ## apparently there are multiple modules in
##D ## database that have '_-_intro' in their
##D ## file name or title. Select the wanted
##D ## module from the list (the one with the
##D ## word 'protrackr' in the instrument names):
##D search.select <- subset(search.results,
##D                         grepl("protrackr", search.results$instruments))
##D 
##D ## get the same details, but now only for
##D ## the specific module based on its ModArchive ID:
##D modArchive.info(search.select$id, api.key = "<your key here>")
##D 
##D ## download the selected module from ModArchive.org:
##D mod <- modArchive.download(search.select$id)
##D 
##D ## here's a randomly picked module from the ModArchive:
##D info.random <- modArchive.random.pick(api.key = "<your key here>")
##D 
##D ## use modArchive.view.by to list the 2nd page
##D ## of MOD files that start with the letter 'A'
##D info.list  <- modArchive.view.by("A", "view_by_list", "MOD",
##D                                  page = 2,
##D                                  api.key = "<your key here>")
##D 
##D ## list the modules of the artist with id number 89200:
##D artist.mods <- modArchive.view.by("89200", "view_modules_by_artistid",
##D                                   format.filter = "MOD",
##D                                   api.key = "<your key here>")
##D 
##D ## here's how you can list MOD files of a
##D ## specific genre:
##D list.genre  <- modArchive.search.genre("Chiptune", "MOD",
##D                                        api.key = "<your key here>")
##D 
##D ## get module info for a specific hash code
##D mod.hash    <- modArchive.search.hash("8f80bcab909f700619025bd7f2975749",
##D                                       "<your key here>")
##D 
##D ## find modarchive artist info, search for artist name
##D ## or artist id:
##D artist.list <- modArchive.search.artist("89200",
##D                                         api.key = "<your key here>")
##D 
##D ## How many requests did I make this month?:
##D modArchive.request.count("<your key here>")
##D 
##D ## How many requests am I allowed to make each month?:
##D modArchive.max.requests("<your key here>")
## End(Not run)



