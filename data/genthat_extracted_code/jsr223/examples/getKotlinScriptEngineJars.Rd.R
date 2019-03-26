library(jsr223)


### Name: getKotlinScriptEngineJars
### Title: Search for Required Kotlin JAR Files
### Aliases: getKotlinScriptEngineJars
### Keywords: interface

### ** Examples

## Not run: 
##D library("jsr223")
##D jars <- getKotlinScriptEngineJars("~/my-path/kotlin")
##D engine <- ScriptEngine$new("kotlin", jars)
##D engine %~% "1 + 1"
##D engine$terminate()
## End(Not run)



