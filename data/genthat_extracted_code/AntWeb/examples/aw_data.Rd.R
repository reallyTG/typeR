library(AntWeb)


### Name: aw_data
### Title: Retrieve data from the AntWeb
### Aliases: aw_data
### Keywords: data download

### ** Examples

# data <- aw_data(genus = "acanthognathus", species = "brevicornis")
# data3 <- aw_data(genus = "acanthognathus", species = "brevicornis", georeferenced = TRUE)
# data2 <- aw_data(scientific_name = "acanthognathus brevicornis")
# sandstone <- aw_data(genus = "Aphaenogaster", habitat = "sandstone")
# data_genus_only <- aw_data(genus = "acanthognathus", limit = 25)
# leaf_cutter_ants  <- aw_data(genus = "acromyrmex")
# data  <- aw_data(genus = "Technomyrmex", bbox = '37.77,-122.46,37.76,-122.47')
# Search just using a bounding box
# data  <- aw_data(bbox = '37.77,-122.46,37.76,-122.47')
# Search by a elevation band
# aw_data(min_elevation = 1500, max_elevation = 2000)
# When you throw a really specimen rich band like below, you'll get a huge number of requests.
# Only the first 1000 records will download first.
# aw_data(min_elevation = 200, max_elevation = 400)
# aw_data(min_date = '1980-01-01', max_date = '1981-01-01')
# fail <- aw_data(scientific_name = "auberti levithorax") # This should fail gracefully



