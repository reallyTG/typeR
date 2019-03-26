library(RYoudaoTranslate)


### Name: youdaoDisplay
### Title: Display query result.
### Aliases: youdaoDisplay
### Keywords: Youdao

### ** Examples

	library(RCurl)
	library(rjson)
	apikey = "498375134"
	keyfrom = "JustForTestYouDao"
	word = "youdao"
	Obj = youdaoTranslate(word,api=apikey,keyfrom=keyfrom)
	youdaoDisplay(Obj,word)



