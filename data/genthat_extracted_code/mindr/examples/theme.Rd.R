library(mindr)


### Name: markmapOption
### Title: Options for markmap creation
### Aliases: markmapOption

### ** Examples

path <- system.file('examples/md', package = 'mindr')
markmap(path = path, remove_curly_bracket = TRUE,
  options = markmapOption(preset = 'colorful')) # 'colorful' theme
markmap(path = path, remove_curly_bracket = TRUE,
  options = markmapOption(color = 'category20b',
    linkShape = 'bracket')) # 'colorful' theme
markmap(path = path, remove_curly_bracket = TRUE,
  options = markmapOption(color = 'category20b',
    linkShape = 'diagonal',
    renderer = 'basic')) # 'colorful' theme



