library(yum)


### Name: simplify_by_flattening
### Title: Simplify the structure of extracted YAML fragments
### Aliases: simplify_by_flattening

### ** Examples

yamlFragmentExample <- '
---
source:
  -
    id: src_1
    label: "Label 1"
  -
    id: src_2
    label: "Label 2"
assertion:
  -
    id: assertion_1
    label: "Assertion 1"
  -
    id: assertion_2
    label: "Assertion 2"
---
';
loadedExampleFragments <-
  load_yaml_fragments(yamlFragmentExample);
simplified <-
  simplify_by_flattening(loadedExampleFragments);

### Pre simmplification:
str(loadedExampleFragments);

### Post simmplification:
str(simplified);




