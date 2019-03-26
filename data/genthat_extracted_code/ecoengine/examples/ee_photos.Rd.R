library(ecoengine)


### Name: ee_photos
### Title: ee_photos
### Aliases: ee_photos

### ** Examples

# Request all photos. This request will paginate.
# merced <- ee_photos(county = "Merced County")
 ee_photos(page_size = 10)
# Search by collection code. See notes above on options
# ee_photos(collection_code = "CalAcademy")
# ee_photos(collection_code = "VTM")
# ee_photos(collection_code = "CalFlora")
# ee_photos(collection_code = "CDFA")
# Search by county.
# sc_county <- ee_photos(county = "Santa Clara County")
# merced <- ee_photos(county = "Merced County")
# merced <- ee_photos(county = "Merced County", page = "all")
# The package also contains a full list of counties
data(california_counties)
# alameda <- ee_photos(county = california_counties[1, 1])
# alameda$data
# You can also get all the data for Alameda county with one request
# alameda <- ee_photos(county = "Alameda county", page = "all")
# Spidering through the rest of the counties can easily be automated.
# Or by author
# charles_results <- ee_photos(author = "Charles Webber", page = 1:2)
# You can also request all pages in a single call by using ee_photos()
# In this example below, there are 6 pages of results (52 result items).
# Function will return all at once.
# racoons <- ee_photos(scientific_name = "Procyon lotor", page = "all")



