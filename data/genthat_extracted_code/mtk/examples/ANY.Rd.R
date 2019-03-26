library(mtk)


### Name: ANY
### Title: The ANY class
### Aliases: ANY

### ** Examples

# creates a new class with "ANY"
setClass(Class="mtkProcess",
		
		representation=representation(
				name="character",
				protocol="character",
				site="character",
				service="character",
				parameters="ANY", 
				ready="logical",
				state="logical",
				result="ANY"
		),
		
		prototype=prototype(parameters=NULL, ready=FALSE,
		                    state=FALSE, result=NULL)

)



