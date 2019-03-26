library(airportr)


### Name: airport_lookup
### Title: Translate airport codes or names into other standard airport
###   formats
### Aliases: airport_lookup

### ** Examples

airport_lookup("CYVR")
airport_lookup("YVR", output_type = "city")
airport_lookup("Vancouver International Airport", input_type="name",output_type = "IATA")
airport_lookup("YVR",input_type = "IATA", output_type = "city")

# Produces a list of similar named airports
airport_lookup("Vancoover","name","city")



