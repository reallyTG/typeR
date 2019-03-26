
get_os_string <- function(unix_string, windows_string) {
    output <- unix_string
    if (.Platform$OS.type == "windows") {
        output <- windows_string
    }

    output
}

find_string <- function(value, lines = c()) {
    found <- FALSE

    for (line in lines) {
        found <- grepl(value, line)

        if (found) {
            break
        }
    }

    found
}
