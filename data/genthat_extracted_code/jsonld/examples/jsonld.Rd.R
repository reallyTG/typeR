library(jsonld)


### Name: jsonld
### Title: Working with JSON-LD
### Aliases: jsonld jsonld_compact jsonld_expand jsonld_flatten
###   jsonld_frame jsonld_from_rdf jsonld_to_rdf jsonld_normalize

### ** Examples

# Example from https://github.com/digitalbazaar/jsonld.js#quick-examples
doc <- '{
  "http://schema.org/name": "Manu Sporny",
  "http://schema.org/url": {"@id": "http://manu.sporny.org/"},
  "http://schema.org/image": {"@id": "http://manu.sporny.org/images/manu.png"}
}'

context <- '{
  "name": "http://schema.org/name",
  "homepage": {"@id": "http://schema.org/url", "@type": "@id"},
  "image": {"@id": "http://schema.org/image", "@type": "@id"}
}'

# Compact and expand:
(out <- jsonld_compact(doc, context))
(expanded <- jsonld_expand(out))

# Convert between JSON and RDF:
cat(nquads <- jsonld_to_rdf(doc))
jsonld_from_rdf(nquads)

# Other utilities:
jsonld_flatten(doc)
cat(jsonld_normalize(doc))



