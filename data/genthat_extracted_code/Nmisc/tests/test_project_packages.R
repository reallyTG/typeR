context("Testing project_package.R")

setup({
    
    prj_path <- "../.."
    if (!file.exists(file.path(prj_path, "cran-comments.md"))) {
        # this test takes place only in the local setup, e.g. devtools::test()
        skip("Package source not found")
    }
    
    empty_output <- tibble::tibble(
        package_name = character(),
        requested_by = character(),
        is_base = logical(),
        source = character(),
        source_path = character(),
        version = character(),
        is_installed = logical()
    )
    
    assign("prj_path", prj_path, envir = .GlobalEnv)
    assign("empty_output", empty_output, envir = .GlobalEnv)
})


test_that("add_package_info works", {
    package_df <- tibble::tibble(
        package_name = "dplyr",
        requested_by = "reference"
    )
    
    package_info <- add_package_info(package_df)
    expected_df <- tibble::tibble(
        package_name = "dplyr", 
        requested_by = "reference", 
        is_base = FALSE, 
        source = "CRAN", 
        source_path = NA_character_,
        version = "0.7.6", 
        is_installed = TRUE
    )
    expect_equal(package_info[[4]], expected_df[[4]])
})


test_that("add_package_info works with empty df as input", {
    
    package_info <- add_package_info(tibble::tibble())
    expected_df <- tibble::tibble(
        is_base = logical(),
        source = character(),
        source_path = character(),
        version = character(),
        is_installed = logical()
    )
    expect_equal(package_info, expected_df)
})


test_that("add_package_info works with not installed package", {
    
    package_info <- add_package_info(tibble::tibble(
        package_name = "random_package",
        requested_by = "reference")
    )
    
    expected_df <- tibble::tibble(
        package_name = "random_package",
        requested_by = "reference",
        is_base = FALSE,
        source = NA_character_,
        source_path = NA_character_,
        version = NA_character_,
        is_installed = FALSE)
    
    expect_equal(package_info, expected_df)
})


test_that("add_package_info stops with invalid input", {
    
    expect_error(add_package_info(NULL))
    expect_error(add_package_info(NA))
    expect_error(add_package_info(NA_character_))
    expect_error(add_package_info(list()))
    expect_error(add_package_info(c()))
})


test_that("get_referenced_packages has consistent output", {
    
    referenced_package <- get_library_packages(prj_path, "os.R", "")
    expect_equal(referenced_package, empty_output)
})


test_that("get_library_packages has consistent output", {
    
    library_package <- get_library_packages(prj_path, "os.R", "")
    expect_equal(library_package, empty_output)
})


test_that("get_description_packages has consistent output", {
    
    description_package <- get_description_packages(
        description_path = file.path(prj_path, "DESCRIPTION"),
        options = c("Depends")
    )
    expect_equal(description_package, empty_output)
})


test_that("get_description_packages warns if wrong description path", {
    
    expect_warning(
        description_package <- get_description_packages(
            description_path = file.path(prj_path, "DESCRIPTIONx"),
            options = c("Depends")
        ),
        regexp = "does not exist!$"
    )
    expect_equal(description_package, empty_output)
    
    expect_warning(
        description_package <- get_description_packages(
            description_path = file.path(prj_path, "NAMESPACE"),
            options = c("Depends")
        ),
        regexp = "is not a dcf file!$"
    )
    expect_equal(description_package, empty_output)
})


test_that("get_packages works", {
    
    package <- get_packages(
        project_path = prj_path, 
        package_options = c('description')
    )
    standard_package <- c("dplyr")
    standard_package_found <- standard_package %in% package$package_name
    all_found <- all(standard_package_found)
    expect_true(all_found)
})


test_that("generate_install_file works", {
    
    needed_package <- get_packages(
        project_path = prj_path,
        include_pattern = ".R",
        package_options = c("description"))
    tmp_inst_file <- tempfile()
    generate_install_file(tmp_inst_file, needed_package)
    
    cran_expected <- 
        needed_package %>%
        dplyr::filter(!.data$is_base & source == "CRAN") %>%
        dplyr::pull(.data$package_name)
    git_expected <- 
        needed_package %>%
        dplyr::filter(!.data$is_base & source == "GitHub") %>%
        dplyr::pull(.data$package_name)
    
    install_package_content <- readLines(tmp_inst_file, n = 2)
    
    eval(parse(text = install_package_content[1])) # cran_packages
    eval(parse(text = install_package_content[2])) # github_packages
    
    expect_setequal(cran_expected, cran_packages)
    expect_setequal(git_expected, github_packages)
    
    unlink(tmp_inst_file)
})
