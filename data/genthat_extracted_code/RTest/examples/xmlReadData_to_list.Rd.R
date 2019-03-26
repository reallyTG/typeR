library(RTest)


### Name: xmlReadData_to_list
### Title: Read an unidentified List of Data Types from TestCase params
### Aliases: xmlReadData_to_list

### ** Examples

data <- '<mylist>

<inputitem1>
<col-defs>
  <coldef name="Column1" type="character"/>
  <coldef name="Column2" type="numeric"/>
</col-defs>
<row name="1"><cell>ID1</cell><cell>1</cell></row>
<row name="2"><cell>ID2</cell><cell>2.1</cell></row>
<row name="3"><cell>ID3</cell><cell>3.1</cell></row>
</inputitem1>
<inputitem2 type="numeric"><element>1</element><element>2</element></inputitem2>

</mylist>
'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_to_list(item)

stopifnot(names(value)[1]=="inputitem1")
stopifnot(names(value)[2]=="inputitem2")
stopifnot(length(value[[2]])==2)



