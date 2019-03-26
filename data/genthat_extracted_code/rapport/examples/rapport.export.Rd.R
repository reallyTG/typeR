library(rapport)


### Name: rapport.export
### Title: Export rapport object
### Aliases: rapport.export tpl.export

### ** Examples

## Not run: 
##D 
##D ## eval some template
##D x <- rapport('Example', data = mtcars, var="hp")
##D 
##D ## try basic parameters
##D rapport.export(x)
##D rapport.export(x, file = 'demo')
##D rapport.export(x, file = 'demo', format = 'odt')
##D 
##D ### append reports
##D # 1) Create a report object with the first report and do not export (optional)
##D report <- rapport.export(x, create = F)
##D # 2) Append some other reports without exporting (optional)
##D report <- rapport.export(x, create = F, append = report)
##D # 3) Export it!
##D rapport.export(append=report)
##D # 4) Export it to other formats too! (optional)
##D rapport.export(append=report, format='rst')
##D 
##D ### exporting multiple reports at once
##D rapport.export(rapport.example('Example', 'all'))
##D rapport.export(rapport.example('Example', 'all'), format = 'odt')
##D rapport.export(list(rapport('univar-descriptive', data = mtcars, var = "hp"),
##D     rapport('Descriptives', data = mtcars, var = "mpg")))
##D 
##D ### Never do this as being dumb:
##D rapport.export()
##D 
##D ### Adding own custom CSS to exported HTML
##D rapport.export(x, options =
##D     sprintf('-c %s', system.file('templates/css/default.css', package='rapport')))
## End(Not run)



