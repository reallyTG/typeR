library(RTest)


### Name: xmlReadData_list
### Title: Read XML Data From Type 'xmlReadData_list' as R 'list' (DUMMY)
### Aliases: xmlReadData_list

### ** Examples

data <- '<mylist>

<data.frame name="ITEM1">
<col-defs>
  <coldef name="Column1" type="character"/>
  <coldef name="Column2" type="numeric"/>
</col-defs>
<row name="1"><cell>ID1</cell><cell>1</cell></row>
<row name="2"><cell>ID2</cell><cell>2.1</cell></row>
<row name="3"><cell>ID3</cell><cell>3.1</cell></row>
</data.frame>
<vector name="ITEM2" type="numeric"><element>1</element><element>2</element></vector>

</mylist>
'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_list(item)
stopifnot(names(value)[1]=="ITEM1")
stopifnot(length(value[[2]])==2)



