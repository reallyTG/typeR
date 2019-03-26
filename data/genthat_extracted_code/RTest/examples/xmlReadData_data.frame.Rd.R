library(RTest)


### Name: xmlReadData_data.frame
### Title: Read XML Data From Type 'xmlReadData_data.frame' as R
###   'data.frame'
### Aliases: xmlReadData_data.frame

### ** Examples

data <- '<data.frame><col-defs>
<coldef name="Column1" type="character"/>
<coldef name="Column2" type="numeric"/>
</col-defs>
<row name="1"><cell>ID1</cell><cell>1</cell></row>
<row name="2"><cell>ID2</cell><cell>2.1</cell></row>
<row name="3"><cell>ID3</cell><cell>3.1</cell></row>
</data.frame>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_data.frame(item)
stopifnot(dim(value)[1]==3)
stopifnot(dim(value)[2]==2)



