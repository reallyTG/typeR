library(RYoudaoTranslate)


### Name: youdaoLookUp
### Title: The most important function in this package.
### Aliases: youdaoLookUp
### Keywords: Youdao

### ** Examples

	library(RCurl)
	library(rjson)
	apikey = "498375134"
	keyfrom = "JustForTestYouDao"
	word = c("youdao", "China", "Homo Sapiens")
	for( i in word)
	{
		Res = youdaoLookUp(i,api=apikey,keyfrom=keyfrom)
		print(Res)
	}



