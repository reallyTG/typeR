library(diffobj)


### Name: Style-class
### Title: Customize Appearance of Diff
### Aliases: Style-class Style StyleRaw-class StyleRaw StyleAnsi-class
###   StyleAnsi StyleAnsi8NeutralRgb-class StyleAnsi8NeutralRgb
###   StyleAnsi8NeutralYb-class StyleAnsi8NeutralYb
###   StyleAnsi256LightRgb-class StyleAnsi256LightRgb
###   StyleAnsi256LightYb-class StyleAnsi256LightYb
###   StyleAnsi256DarkRgb-class StyleAnsi256DarkRgb
###   StyleAnsi256DarkYb-class StyleAnsi256DarkYb StyleHtml-class StyleHtml
###   StyleHtmlLightRgb-class StyleHtmlLightRgb StyleHtmlLightYb-class
###   StyleHtmlLightYb

### ** Examples

## Not run: 
##D ## Create a new style based on existing style by changing
##D ## gutter symbols and guide color; see `?StyleFuns` and
##D ## `?StyleText` for a full list of adjustable elements
##D my.style <- StyleAnsi8NeutralYb()
##D my.style   ## `show` method gives you a preview of the style
##D my.style@text@gutter.insert <- "+++"
##D my.style@text@gutter.delete <- "---"
##D my.style@funs@text.guide <- crayon::green
##D my.style   ## Notice gutters and guide color
##D 
##D ## Provide a custom style sheet; here we assume there is a style sheet at
##D ## `HOME/web/mycss.css`
##D my.css <- file.path(path.expand("~"), "web", "mycss.css")
##D diffPrint(1:5, 2:6, style=StyleHtmlLightYb(css=my.css))
##D 
##D ## Turn of scaling; notice how we pass a list to `style`
##D ## and we do not need to specify a specific style
##D diffPrint(letters, letters[-5], format="html", style=list(scale=FALSE))
##D 
##D ## Alternatively we can do the same by specifying a style, but we must
##D ## give an exact html style instead of relying on preferences to pick
##D ## one for us
##D my.style <- StyleHtmlLightYb(scale=FALSE)
##D diffPrint(letters, letters[-5], style=my.style)
## End(Not run)
## Return only the raw HTML without any of the headers
as.character(
  diffPrint(1:5, 2:6, format="html", style=list(html.output="diff.only"))
)



