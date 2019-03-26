library(datapackage.r)


### Name: Resource.load
### Title: Instantiate 'Resource' class
### Aliases: Resource.load

### ** Examples


# Resource Load - with base descriptor
descriptor <- '{"name":"name","data":["data"]}'
resource <- Resource.load(descriptor)
resource$name
resource$descriptor


# Resource Load - with tabular descriptor
descriptor2 <- '{"name":"name","data":["data"],"profile":"tabular-data-resource"}' 
resource2 <- Resource.load(descriptor2)
resource2$name
resource2$descriptor


# Retrieve Resource Descriptor
descriptor3 <- '{"name": "name","data": "data"}'
resource3 <- Resource.load(descriptor3)
resource3$descriptor


# Expand Resource Descriptor - General Resource
descriptor4 <- '{"name": "name","data": "data"}'
resource4 <- Resource.load(descriptor4)
resource4$descriptor

# Expand Resource Descriptor - Tabular Resource Dialect
descriptor5 <- helpers.from.json.to.list('{
                                        "name": "name",
                                        "data": "data",
                                        "profile": "tabular-data-resource",
                                        "dialect": {"delimiter": "custom"}
                                        }')
resource5 <- Resource.load(descriptor5)
resource5$descriptor


# Resource - Inline source/sourceType
descriptor6 <- '{"name": "name","data": "data","path": ["path"]}'
resource6 <- Resource.load(descriptor6)
resource6$source

# Resource - Remote source/sourceType
descriptor7 <- '{"name": "name","path": ["http://example.com//table.csv"]}'
resource7 <- Resource.load(descriptor7)
resource7$source 

# Resource - Multipart Remote source/sourceType
descriptor8 <- '{
              "name": "name",
              "path": ["http://example.com/chunk1.csv", "http://example.com/chunk2.csv"]
              }'
resource8 <- Resource.load(descriptor8)
resource8$source 




