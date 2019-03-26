library(js)


### Name: js_eval
### Title: Evaluate JavaScript
### Aliases: js_eval

### ** Examples

# Stateless evaluation
js_eval("(function() {return 'foo'})()")

# Use V8 for stateful evaluation
ct <- V8::new_context()
ct$eval("var foo = 123")
ct$get("foo")



