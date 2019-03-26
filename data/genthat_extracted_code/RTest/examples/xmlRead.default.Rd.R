library(RTest)


### Name: xmlRead.default
### Title: General import function to reads XML data of different types
### Aliases: xmlRead.default

### ** Examples

data <- '<text type="character">My text is awesome</text>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlRead.default(item)
stopifnot(value=="My text is awesome")

data <- '<list><data.frame><col-defs>
<coldef name="Column1" type="character"/>
<coldef name="Column2" type="numeric"/>
</col-defs>
<row name="1"><cell>ID1</cell><cell>1</cell></row>
<row name="2"><cell>ID2</cell><cell>2.1</cell></row>
<row name="3"><cell>ID3</cell><cell>3.1</cell></row>
</data.frame></list>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlRead.default(item)
stopifnot(dim(value)[1]==3)
stopifnot(dim(value)[2]==2)

data <- '<variable type="character" value="My text is awesome"/>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlRead.default(item)
stopifnot(value=="My text is awesome")



