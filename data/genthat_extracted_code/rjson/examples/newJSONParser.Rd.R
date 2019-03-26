library(rjson)


### Name: newJSONParser
### Title: Convert buffered JSON objects To R
### Aliases: newJSONParser
### Keywords: interface

### ** Examples


sample_json <- '
	{
		"breakfast" : [ "milk", "fruit loops", "juice" ],
		"lunch" : [ "left over sushi" ]
	}
'

parser <- newJSONParser()

parser$addData( sample_json )
food <- parser$getObject()
print( food )

#This is equivalent to using FromJSON( sample_json )
#However, sample_json can be split into several parts:

### EXAMPLE 2:

part_1 <- '{ "breakfast" : [ "milk", "fruit loops", "juice" ], '
part_2 <- '"lunch" : [ "left over sushi" ]'
# close off the first object, and create a 2nd JSON object, which is simply an 
# array
part_3 <- '} [1,2,3,4,5]' 

parser <- newJSONParser()
parser$addData( part_1 )
parser$getObject() #returns NULL - since part_1 isn't complete
parser$addData( part_2 )
parser$getObject() #returns NULL - since part_2 still isn't complete
parser$addData( part_3 )
parser$getObject() #returns the first food object
parser$getObject() #returns the second array







