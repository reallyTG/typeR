options(contractr.autoinject = FALSE)
library(dplyr)
library(tibble)
library(purrr)
library(contractr)
library(readr)

has_type_declaration <- function(package) {
    package_type_declaration_path <- system.file("TYPEDECLARATION", package = package)
    contractr_type_declaration_path <- system.file("TYPEDECLARATION", package, package = "contractr")
    file.exists(package_type_declaration_path) || file.exists(contractr_type_declaration_path)
}


is_bound_to_function <- function(var_name, env) {
    is.function(get(var_name, env))
}

get_package_functions <- function(package) {
    ns <- getNamespace(package)
    keep(ls(ns), function(var_name) is_bound_to_function(var_name, ns))
}

is_function_typed <- function(package, package_functions) {
    typed_functions <-
      package %>%
      import_type_declarations()

    map_lgl(package_functions, function(fun) { fun %in% typed_functions })
}


main <- function() {
     typed_packages <-
      installed.packages()[,1] %>%
      keep(has_type_declaration)


    attempted_functions <-
      typed_packages %>%
      map_dfr(function(package) {
          funs <- get_package_functions(package)
          tibble(package_name = package,
                 function_name = funs,
                 is_typed = is_function_typed(package, funs))
      }) %>%
      write_csv("attempted-functions.csv")

    typing_summary <-
      attempted_functions %>%
      group_by(package_name) %>%
      summarize(function_count = n(),
                typed_function_count = sum(is_typed),
                all_typed = all(is_typed)) %>%
      ungroup() %>%
      write_csv("typing_summary.csv")

    cat(sprintf("Total packages: %s\n", nrow(typing_summary)))
    cat(sprintf("Fully typed packages: %s\n", sum(typing_summary$all_typed)))
    cat(sprintf("Partially typed packages: %s\n", sum(!typing_summary$all_typed)))

    cat(sprintf("Total functions: %s\n", sum(typing_summary$function_count)))
    cat(sprintf("Typed functions: %s\n", sum(typing_summary$typed_function_count)))
    cat(sprintf("Missing functions: %s\n", sum(typing_summary$function_count - typing_summary$typed_function_count)))
}

main()
